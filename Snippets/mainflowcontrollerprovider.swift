// IDECodeSnippetTitle: MainFlowControllerProvider
// IDECodeSnippetCompletionPrefix: swift_mainflowcontroller-provider
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: MainFlowController provider protocol
import UIKit
	import Foundation
	
	protocol MainFlowControllerProvider: class {
	    var mainFlowController: UIViewController { get }
	}
	
	typealias MainFlowController = MainFlowControllerProvider & FlowController
