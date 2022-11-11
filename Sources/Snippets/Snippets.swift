import ArgumentParser
import Foundation
import XcodeSnippets

// https://useyourloaf.com/blog/using-swift-codable-with-property-lists/
// https://stackoverflow.com/questions/45461607/decode-propertylist-using-swift-4-codable-propertylistdecoder
// https://theswiftdev.com/2018/07/10/ultimate-grand-central-dispatch-tutorial-in-swift/
// http://www.vadimbulavin.com/benchmarking-locking-apis/

// https://www.hackingwithswift.com/quick-start/concurrency/how-to-create-a-task-group-and-add-tasks-to-it
// https://swiftsenpai.com/swift/understanding-task-groups/
// https://www.avanderlee.com/concurrency/tasks/
// https://www.avanderlee.com/swift/operations/
// https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html

@main
struct Snippets: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Snippets importer/ exporter tool.",
        discussion: "Exports or imports code snippets from/to Xcode-user-data, located in `/Users/[USERNAME]/Library/Developer/Xcode/UserData/CodeSnippets`.",
        subcommands: [Import.self, Export.self],
        defaultSubcommand: Export.self
    )

    struct Import: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Importing code snippets to Xcode.")
        @OptionGroup() var options: Snippets.Options

        func run() {
            let xcodeSnippets = XcodeSnippets()
            xcodeSnippets.import(toPath: options.to, fromPath: options.from) { _ in }
        }
    }

    struct Export: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Export code snippets from Xcode.")
        @OptionGroup() var options: Snippets.Options

        func run() {
            let xcodeSnippets = XcodeSnippets()
            xcodeSnippets.export(fromPath: options.from, toPath: options.to) { _ in }
        }
    }

    struct Options: ParsableArguments {
        @Argument(help: "Folder to import snippets from") var from: String?
        @Argument(help: "Folder to use for snippets") var to: String?
    }    
}
