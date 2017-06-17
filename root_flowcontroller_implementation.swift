// IDECodeSnippetTitle: Root FlowController implementation
// IDECodeSnippetCompletionPrefix: swift_root_flowcontroller-implementation
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Root FlowController implementation
import UIKit
	import Foundation
	
	protocol <#name#>FlowController {
	    func start()
	}
	
	final class <#name#>FlowControllerImplementation: MainFlowController, <#name#>FlowController {
	    var mainFlowController: UIViewController {
	        return navigationController
	    }
	    var childFlowController: [FlowController] = []
	    
	    private lazy var navigationController = UINavigationController()
	    
	    init(window: UIWindow?) {
	        window?.rootViewController = mainFlowController
	        window?.makeKeyAndVisible()
	    }
	    
	    func start() {
	        navigationController.viewControllers = [<#name#>ViewController()]
	    }
	}
	
