@testable import FileKit
@testable import XcodeSnippets
import XCTest

final class XcodeSnippetsTests: XCTestCase {
    override func setUp() {
        // {
        // "scopes" : [
        //     "ClassImplementation"
        // ],
        // "summary" : "Setup auto layout helper views",
        // "userSnippet" : true,
        // "title" : "Autolayout helpers",
        // "completionPrefix" : "objc_al_setup-auto-layout",
        // "language" : "Xcode.SourceCodeLanguage.Objective-C",
        // "contents" : "the snippet contents",
        // "identifier" : "D8F9924D-2B17-43F0-AF62-680013CA5FFC",
        // "version" : 2
        // }
        _jsonString =
            "{\"scopes\":[\"ClassImplementation\"],\"summary\":\"Setup auto layout helper views\",\"userSnippet\":true,\"title\":\"Autolayout helpers\",\"completionPrefix\":\"objc_al_setup-auto-layout\",\"language\":\"Xcode.SourceCodeLanguage.Objective-C\",\"contents\":\"the snippet contents\",\"identifier\":\"D8F9924D-2B17-43F0-AF62-680013CA5FFC\",\"version\":2}"
        let jsonData = _jsonString.data(using: .utf8)
        _jsonFile = FileKit.fileInCachesFolder(withName: "test.json", data: jsonData)

        // <?xml version="1.0" encoding="UTF-8"?>
        // <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        // <plist version="1.0">
        // <dict>
        //    <key>IDECodeSnippetCompletionPrefix</key>
        //    <string>cnstrnt</string>
        //    <key>IDECodeSnippetCompletionScopes</key>
        //    <array>
        //        <string>CodeBlock</string>
        //    </array>
        //    <key>IDECodeSnippetContents</key>
        //    <string>the snippet content</string>
        //    <key>IDECodeSnippetIdentifier</key>
        //    <string>3B6DD540-B447-48DB-9CDE-BD2640EADDF8</string>
        //    <key>IDECodeSnippetLanguage</key>
        //    <string>Xcode.SourceCodeLanguage.Objective-C</string>
        //    <key>IDECodeSnippetSummary</key>
        //    <string>Create layout constraint using visual format</string>
        //    <key>IDECodeSnippetTitle</key>
        //    <string>Create NSLayoutConstraint visual format</string>
        //    <key>IDECodeSnippetUserSnippet</key>
        //    <true/>
        //    <key>IDECodeSnippetVersion</key>
        //    <integer>2</integer>
        // </dict>
        // </plist>
        _plistString = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
           <key>IDECodeSnippetCompletionPrefix</key>
           <string>cnstrnt</string>
           <key>IDECodeSnippetCompletionScopes</key>
           <array>
               <string>CodeBlock</string>
           </array>
           <key>IDECodeSnippetContents</key>
           <string>the snippet content</string>
           <key>IDECodeSnippetIdentifier</key>
           <string>3B6DD540-B447-48DB-9CDE-BD2640EADDF8</string>
           <key>IDECodeSnippetLanguage</key>
           <string>Xcode.SourceCodeLanguage.Objective-C</string>
           <key>IDECodeSnippetSummary</key>
           <string>Create layout constraint using visual format</string>
           <key>IDECodeSnippetTitle</key>
           <string>Create NSLayoutConstraint visual format</string>
           <key>IDECodeSnippetUserSnippet</key>
           <true/>
           <key>IDECodeSnippetVersion</key>
           <integer>2</integer>
        </dict>
        </plist>
        """
        let plistData = _plistString.data(using: .utf8)
        _plistFile = FileKit.fileInCachesFolder(withName: "test.codesnippet", data: plistData)
    }

    func testSnippetJsonParser() {
        let subject = SnippetJsonParser()
        XCTAssertNoThrow(try subject.parse(file: _jsonFile), "Failed to parse json-snippet.")
    }

    func testSnippetJson() {
        let subject = SnippetJsonParser()
        let jsonSnippet = try? subject.parse(file: _jsonFile)
        guard let snippet = jsonSnippet else {
            XCTFail("Failed to parse json-snippet.")
            return
        }
        XCTAssertEqual(snippet.title, "Autolayout helpers", "'Autolayout helpers' expected, got \(snippet.title)")
        XCTAssertEqual(snippet.scopes, ["ClassImplementation"], "Array ['ClassImplementation'], got \(snippet.scopes)")
        XCTAssertEqual(snippet.version, 2, "Version 2 expected, got \(snippet.version)")
        XCTAssertEqual(snippet.summary, "Setup auto layout helper views", "'Setup auto layout helper views' expected, got \(snippet.summary)")
        XCTAssertEqual(snippet.userSnippet, true, "true expected, got \(snippet.userSnippet)")
        XCTAssertEqual(snippet.completionPrefix, "objc_al_setup-auto-layout", "'objc_al_setup-auto-layout' expected, got \(snippet.completionPrefix)")
        XCTAssertEqual(snippet.language, "Xcode.SourceCodeLanguage.Objective-C", "'Xcode.SourceCodeLanguage.Objective-C' expected, got \(snippet.language)")
        XCTAssertEqual(snippet.contents, "the snippet contents", "'the snippet contents' expected, got \(snippet.contents)")
        XCTAssertEqual(snippet.identifier, "D8F9924D-2B17-43F0-AF62-680013CA5FFC", "'D8F9924D-2B17-43F0-AF62-680013CA5FFC' expected, got \(snippet.identifier)")
    }

    func testSnippetPlistParser() {
        let subject = SnippetPlistParser()
        XCTAssertNoThrow(try subject.parse(file: _plistFile), "Failed to parse plist-snippet.")
    }

    func testSnippetPlist() {
        let subject = SnippetPlistParser()
        let plistSnippet = try? subject.parse(file: _plistFile)
        guard let snippet = plistSnippet else {
            XCTFail("Failed to parse plist-snippet.")
            return
        }
        XCTAssertEqual(snippet.title, "Create NSLayoutConstraint visual format", "'Create NSLayoutConstraint visual format' expected, got \(snippet.title)")
        XCTAssertEqual(snippet.scopes, ["CodeBlock"], "Array ['CodeBlock'], got \(snippet.scopes)")
        XCTAssertEqual(snippet.version, 2, "Version 2 expected, got \(snippet.version)")
        XCTAssertEqual(snippet.summary, "Create layout constraint using visual format", "'Create layout constraint using visual format' expected, got \(snippet.summary)")
        XCTAssertEqual(snippet.userSnippet, true, "true expected, got \(snippet.userSnippet)")
        XCTAssertEqual(snippet.completionPrefix, "cnstrnt", "'cnstrnt' expected, got \(snippet.completionPrefix)")
        XCTAssertEqual(snippet.language, "Xcode.SourceCodeLanguage.Objective-C", "'Xcode.SourceCodeLanguage.Objective-C' expected, got \(snippet.language)")
        XCTAssertEqual(snippet.contents, "the snippet content", "'the snippet content' expected, got \(snippet.contents)")
        XCTAssertEqual(snippet.identifier, "3B6DD540-B447-48DB-9CDE-BD2640EADDF8", "'3B6DD540-B447-48DB-9CDE-BD2640EADDF8' expected, got \(snippet.identifier)")
    }

    private var _jsonString: String!
    private var _jsonFile: File!
    private var _plistString: String!
    private var _plistFile: File!
}
