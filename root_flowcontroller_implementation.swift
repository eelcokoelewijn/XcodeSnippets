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
        protocol <#name#>PresenterDelegate: class {
		    
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
		        let presenter = Mixin<#name#>Presenter()
                navigationController.viewControllers = [<#name#>ViewController(presenter: presenter)]
		    }
}

extension <#name#>FlowControllerImplementation: <#name#>PresenterDelegate {
}
