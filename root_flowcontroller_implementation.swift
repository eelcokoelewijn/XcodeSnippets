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
        protocol <#name#>FlowControllerDelegate {
		    
		}
		final class <#name#>FlowControllerImplementation: MainFlowController, <#name#>FlowController {
		    var mainFlowController: UIViewController {
		        return navigationController
		    }
		    var childFlowController: [FlowController] = []
		    
            private lazy var navigationController: UINavigationController = {
                let nc = UINavigationController()
                nc.navigationBar.isTranslucent = false
                return nc
            }()
		    
		    init(window: UIWindow?) {
		        window?.rootViewController = mainFlowController
		        window?.makeKeyAndVisible()
		    }
		    
		    func start() {
		        navigationController.viewControllers = [<#name#>ViewController()]
		    }
}

extension <#name#>FlowControllerImplementation: <#name#>FlowControllerDelegate {
}
