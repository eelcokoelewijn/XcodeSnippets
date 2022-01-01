import Foundation
import FileKit

protocol Snippet: Codable {
    var completionPrefix: String { get }
    var scopes: [String] { get }
    var contents: String { get }
    var identifier: String { get }
    var language: String { get }
    var summary: String { get }
    var title: String { get }
    var userSnippet: Bool { get }
    var version: Int { get }
}

struct JSONSnippet: Snippet {
    let completionPrefix: String
    let scopes: [String]
    let contents: String
    let identifier: String
    let language: String
    let summary: String
    let title: String
    let userSnippet: Bool
    let version: Int

    enum CodingKeys: String, CodingKey {
        case completionPrefix
        case scopes
        case contents
        case identifier
        case language
        case summary
        case title
        case userSnippet
        case version
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        completionPrefix = try values.decode(String.self, forKey: .completionPrefix)
        scopes = try values.decode(Array<String>.self, forKey: .scopes)
        contents = try values.decode(String.self, forKey: .contents)
        identifier = try values.decode(String.self, forKey: .identifier)
        language = try values.decode(String.self, forKey: .language)
        summary = try values.decode(String.self, forKey: .summary)
        title = try values.decode(String.self, forKey: .title)
        userSnippet = try values.decode(Bool.self, forKey: .userSnippet)
        version = try values.decode(Int.self, forKey: .version)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PlistSnippet.CodingKeys.self)
        try container.encode(completionPrefix, forKey: .completionPrefix)
        try container.encode(scopes, forKey: .scopes)
        try container.encode(contents, forKey: .contents)
        try container.encode(identifier, forKey: .identifier)
        try container.encode(language, forKey: .language)
        try container.encode(summary, forKey: .summary)
        try container.encode(title, forKey: .title)
        try container.encode(userSnippet, forKey: .userSnippet)
        try container.encode(version, forKey: .version)
    }
}

struct PlistSnippet: Snippet {
    let completionPrefix: String
    let scopes: [String]
    let contents: String
    let identifier: String
    let language: String
    let summary: String
    let title: String
    let userSnippet: Bool
    let version: Int

    enum CodingKeys: String, CodingKey {
        case completionPrefix = "IDECodeSnippetCompletionPrefix"
        case scopes = "IDECodeSnippetCompletionScopes"
        case contents = "IDECodeSnippetContents"
        case identifier = "IDECodeSnippetIdentifier"
        case language = "IDECodeSnippetLanguage"
        case summary = "IDECodeSnippetSummary"
        case title = "IDECodeSnippetTitle"
        case userSnippet = "IDECodeSnippetUserSnippet"
        case version = "IDECodeSnippetVersion"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: JSONSnippet.CodingKeys.self)
        try container.encode(completionPrefix, forKey: .completionPrefix)
        try container.encode(scopes, forKey: .scopes)
        try container.encode(contents, forKey: .contents)
        try container.encode(identifier, forKey: .identifier)
        try container.encode(language, forKey: .language)
        try container.encode(summary, forKey: .summary)
        try container.encode(title, forKey: .title)
        try container.encode(userSnippet, forKey: .userSnippet)
        try container.encode(version, forKey: .version)
    }
}

enum SnippetParserError: Error {
    case error
    case noCodeSnippet
}

enum SnippetType: String {
    case json
    case plist = "codesnippet"
}

protocol SnippetParser {
    associatedtype T: Decodable
    func parse(file: File) throws -> T
}

class SnippetJsonParser: SnippetParser {
    func parse(file: File) throws -> JSONSnippet {
        guard let data = file.data else {
            throw(SnippetParserError.error)
        }
        do {
            let decoder = JSONDecoder()
            decoder.dataDecodingStrategy = JSONDecoder.DataDecodingStrategy.base64
            let snippet = try decoder.decode(JSONSnippet.self, from: data)
            return snippet
        } catch {
            throw (SnippetParserError.error)
        }
    }
}

class SnippetPlistParser: SnippetParser {
    func parse(file: File) throws -> PlistSnippet {
        guard file.location.pathExtension == "codesnippet" else {
            throw(SnippetParserError.noCodeSnippet)
        }
        guard let data = file.data else {
            throw(SnippetParserError.error)
        }
        do {
            let decoder = PropertyListDecoder()
            let snippet = try decoder.decode(PlistSnippet.self, from: data)
            return snippet
        } catch {
            throw (SnippetParserError.error)
        }
    }
}

enum SnippetWriterError: Error {
    case error
}

protocol SnippetWriter {
    associatedtype T: Encodable
    func write(snippet: T, toFile file: File) throws -> Bool
}

class SnippetJsonWriter: SnippetWriter {
    func write(snippet: PlistSnippet, toFile file: File) throws -> Bool {
        let fs = FileKit()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(snippet) else {
            throw(SnippetWriterError.error)
        }
        do {
            let jsonFile = File(name: file.name, folder: file.folder, data: data)
            _ = try fs.save(file: jsonFile)
        } catch {
            throw(SnippetWriterError.error)
        }
        return true
    }
}

class SnippetPlistWriter: SnippetWriter {
    func write(snippet: JSONSnippet, toFile file: File) throws -> Bool {
        let fs = FileKit()
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        guard let data = try? encoder.encode(snippet) else {
            throw(SnippetWriterError.error)
        }
        do {
            let plistFile = File(name: file.name, folder: file.folder, data: data)
            _ = try fs.save(file: plistFile)
        } catch {
            throw(SnippetWriterError.error)
        }
        return true
    }
}

public class XcodeSnippets {
    let operationQueue: OperationQueue

    public init() {
        operationQueue = OperationQueue()
        operationQueue.name = "nl.eko.xcodesnippets-parse"
    }

    public func export(toPath path: String = "default", completion: @escaping (_ success: Bool) throws -> Void) {
        let fk = FileKit()
        var operations: [BlockOperation] = []
        let pathToCodeSnippets = FileKit.pathToFolder(forSearchPath: .libraryDirectory)
            .appendingPathComponent("Developer/Xcode/UserData/CodeSnippets", isDirectory: true)
        let f = Folder(location: pathToCodeSnippets)
        guard let folder = try? fk.load(folder: f) else {
            try? completion(false)
            return
        }
        print("Read \(folder.files.count - 1) snippets from \(pathToCodeSnippets.absoluteString)")
        let destination = URL(fileURLWithPath: "snippets.json", isDirectory: true)
            .appendingPathComponent(path, isDirectory: true)
        let destinationFolder = Folder(location: destination)
        do {
            print("Create folder \(destinationFolder.location.absoluteString)")
            try _ = fk.create(folder: destinationFolder)
        } catch let error {
            print(error.localizedDescription)
            try? completion(false)
            return
        }
        let plistParser = SnippetPlistParser()
        let jsonWriter = SnippetJsonWriter()
        folder.files.forEach { file in
            let operation = createOperation(on: file,
                                            destination: destinationFolder,
                                            type: .json,
                                            parser: plistParser,
                                            writer: jsonWriter)
            operations.append(operation)
        }
        self.operationQueue.addOperations(operations, waitUntilFinished: true)
        try? completion(true)
    }

    public func `import`(toPath path: String = "default", completion: @escaping (_ success: Bool) throws -> Void) {
        let fk = FileKit()
        var operations: [BlockOperation] = []
        let pathToCodeSnippets = URL(fileURLWithPath: "snippets.json", isDirectory: true)
            .appendingPathComponent(path, isDirectory: true)
        let f = Folder(location: pathToCodeSnippets)
        guard let folder = try? fk.load(folder: f) else {
            try? completion(false)
            return
        }
        print("Read \(folder.files.count - 1) snippets from \(pathToCodeSnippets.absoluteString)")
        let destination = FileKit.pathToFolder(forSearchPath: .libraryDirectory)
            .appendingPathComponent("Developer/Xcode/UserData/CodeSnippets", isDirectory: true)
        let destinationFolder = Folder(location: destination)
        
        do {
            print("Create folder \(destinationFolder.location.absoluteString)")
            try _ = fk.create(folder: destinationFolder)
        } catch let error {
            print(error.localizedDescription)
            try? completion(false)
            return
        }
        
        let jsonParser = SnippetJsonParser()
        let plistWriter = SnippetPlistWriter()
        folder.files.forEach { file in
            let operation = createOperation(on: file,
                                            destination: destinationFolder,
                                            type: .plist,
                                            parser: jsonParser,
                                            writer: plistWriter)
            operations.append(operation)
        }
        self.operationQueue.addOperations(operations, waitUntilFinished: true)
        try? completion(true)
    }

}

private extension XcodeSnippets {
    func createOperation<P: SnippetParser, W: SnippetWriter>(on file: File,
                                                             destination: Folder,
                                                             type: SnippetType,
                                                             parser: P,
                                                             writer: W) -> BlockOperation where W.T: Snippet {
        let fs = FileKit()
        let operation = BlockOperation() {
            guard let loadedFile = try? fs.load(file: file),
                let parseResult = try? parser.parse(file: loadedFile),
                let snippet = parseResult as? W.T else {
                    return
            }
            print("\(snippet.title)")
            let filename = self.createFileName(forSnippet: snippet, snippetType: type)
            let resultFile = File(name: filename, folder: destination)
            do {
                _ = try writer.write(snippet: snippet, toFile: resultFile)
            } catch {
                print("Failed to convert \(snippet.title)")
            }
        }
        return operation
    }

    func createFileName(forSnippet snippet: Snippet, snippetType type: SnippetType) -> String {
        var filename: String = ""
        if type == .plist {
            filename = snippet.identifier
        } else {
            if !snippet.completionPrefix.isEmpty {
                filename = snippet.completionPrefix
            }
            if snippet.language == "Xcode.SourceCodeLanguage.Objective-C" {
                filename.append(".objc")
            } else if snippet.language == "Xcode.SourceCodeLanguage.Swift" {
                filename.append(".swift")
            }
        }
        filename.append(".\(type.rawValue)")
        return filename
    }
}
