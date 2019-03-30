import XCTest
@testable import XcodeSnippets

final class XcodeSnippetsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XcodeSnippets().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
