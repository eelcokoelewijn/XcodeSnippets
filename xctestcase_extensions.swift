// IDECodeSnippetTitle: XCTestCase extensions
// IDECodeSnippetCompletionPrefix: swift_xctestcase-extension
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Expecting, wait and delay
import Foundation
			import XCTest
			
			extension XCTestCase {
			    func expecting(description: String = "\(#function)") -> XCTestExpectation {
			        return expectation(description: description)
			    }
			
			    func wait(_ timeout: TimeInterval = 0.1) {
			        self.waitForExpectations(timeout: timeout, handler: nil)
			    }
			    
			    func delay(_ delay: Double = 1.0, executeAfter: @escaping () -> Void) {
			        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
			            executeAfter()
			        }
			    }
			}
			
		
	
