// IDECodeSnippetTitle: Uses & Mixin cake pattern with view presenter
// IDECodeSnippetCompletionPrefix: swift-view-presenter-uses-mixin-di
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Uses & Mixin cake pattern DI with View Presenter
protocol <#protocol-view-name#>View: class {
	
	}
	
	protocol <#protocol-presenter-name#>Presenter {
	    func start()
	    func setView(_ view: <#protocol-view-name#>View)
	}
	
	protocol Uses<#protocol-presenter-name#>Presenter {
	    var <#protocol-instance-presenter-name#>: <#protocol-presenter-name#>Presenter { get }
	}
	
	class Mixin<#protocol-presenter-name#>Presenter: <#protocol-presenter-name#>Presenter {
		var view: <#ViewName#>View?
        func start() {
	
		}
	
		func setView(_ view: <#protocol-view-name#>View) {
            self.view = view
		}
	}
	
