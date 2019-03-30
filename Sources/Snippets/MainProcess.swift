import Foundation
import XcodeSnippets
import FileKit

enum XcodeSnippetsCommand: String {
    case `import`
    case export
    case help
}

class MainProcess {
    private var arguments: [String] = []
    private let xcodeSnippets = XcodeSnippets()
    var shouldExit: Bool = false
    var exitCode: Int32 = 0

    func start(arguments: [String]) {
        self.arguments = arguments
        guard arguments.count > 1, let command = XcodeSnippetsCommand(rawValue: arguments[1]) else {
            shouldExit = true
            exitCode = 1
            return
        }
        switch command {
        case .`import`:
            xcodeSnippets.import { [weak self] (result) in
                self?.shouldExit = true
                self?.exitCode = result ? 0 : 1
            }
        case .export:
            xcodeSnippets.export { [weak self] result in
                self?.shouldExit = true
                self?.exitCode = result ? 0 : 1
            }
        case .help:
            fallthrough
        @unknown default:
            print("""
                - import: importing code snippets to Xcode
                - export: export code snippets from Xcode
                """)
            shouldExit = true
            exitCode = 0
        }
    }
}
