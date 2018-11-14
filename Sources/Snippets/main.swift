import Foundation

// https://useyourloaf.com/blog/using-swift-codable-with-property-lists/
// https://stackoverflow.com/questions/45461607/decode-propertylist-using-swift-4-codable-propertylistdecoder
// https://theswiftdev.com/2018/07/10/ultimate-grand-central-dispatch-tutorial-in-swift/
// http://www.vadimbulavin.com/benchmarking-locking-apis/

var runLoop: RunLoop = RunLoop.current
var process: MainProcess = MainProcess()

autoreleasepool {
    process.start(arguments: CommandLine.arguments)
    while (!process.shouldExit &&
        (runLoop.run(mode: RunLoop.Mode.default, before: Date.distantFuture))) {
        // do nothing
    }
    exit(process.exitCode)
}


