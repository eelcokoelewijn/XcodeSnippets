// IDECodeSnippetTitle: MVP template
// IDECodeSnippetCompletionPrefix: swift_mvp-template
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: MVP template with view/presenter skeleton
protocol <#ViewName#>View: class {
	    var presenter: <#PresenterName#>Presenter { get }
	}
	
	protocol <#PresenterName#>Presenter {
	    var view: <#ViewName#>View? { get }
	    func attach(view: <#ViewName#>View)
	    func detach()
	}
	
	class <#PresenterName#>PresenterImplementation: <#PresenterName#>Presenter {
	    weak var view: <#ViewName#>View?
	
	    func attach(view: <#ViewName#>View) {
	        self.view = view
	    }
	
	    func detach() {
	        view = nil
	    }
	}
