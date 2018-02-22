// IDECodeSnippetTitle: Module assembly
// IDECodeSnippetCompletionPrefix: swift_module-assembly
// IDECodeSnippetCompletionScopes: All
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Create module assembly
import UIKit
import Swinject

final class <#module_info.name#>Assembly: Assembly {
    func assemble(container: Container) {
        container.register(<#module_info.name#>ViewController.self) { (res: Resolver, nav: UINavigationController) in
            let router = res.resolve(<#module_info.name#>Router.self, argument: nav)!
            let presenter = res.resolve(<#module_info.name#>Presenter.self, argument: router)!
            return <#module_info.name#>ViewController(presenter: presenter)
        }
        
        container.register(<#module_info.name#>Presenter.self) { (_: Resolver, router: <#module_info.name#>Router) in
            return <#module_info.name#>PresenterImplementation(router: router)
        }
        
        container.register(<#module_info.name#>Router.self) { (res: Resolver, nav: UINavigationController) in
            return <#module_info.name#>RouterImplementation(navigationController: nav, resolver: res)
        }
    }
}

