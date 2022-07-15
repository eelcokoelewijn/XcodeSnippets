import ArgumentParser
import Foundation
import XcodeSnippets

// https://useyourloaf.com/blog/using-swift-codable-with-property-lists/
// https://stackoverflow.com/questions/45461607/decode-propertylist-using-swift-4-codable-propertylistdecoder
// https://theswiftdev.com/2018/07/10/ultimate-grand-central-dispatch-tutorial-in-swift/
// http://www.vadimbulavin.com/benchmarking-locking-apis/

struct Snippets: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Snippets importer/ exporter tool.",
        discussion: "Exports or imports code snippets from/to Xcode-user-data, located in `/Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets`.",
        subcommands: [Import.self, Export.self],
        defaultSubcommand: Export.self
    )
}

extension Snippets {
    struct Import: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Importing code snippets to Xcode.")
        @OptionGroup() var options: Snippets.Options

        func run() {
            let xcodeSnippets = XcodeSnippets()
            xcodeSnippets.import(toPath: options.path) { result in
                throw ExitCode(result ? 0 : 1)
            }
        }
    }

    struct Export: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Export code snippets from Xcode.")
        @OptionGroup() var options: Snippets.Options

        func run() {
            let xcodeSnippets = XcodeSnippets()
            xcodeSnippets.export(toPath: options.path) { result in
                throw ExitCode(result ? 0 : 1)
            }
        }
    }

    struct Options: ParsableArguments {
        @Argument(help: "Subfolder to use for snippets") var path = "default"
    }
}

Snippets.main()
