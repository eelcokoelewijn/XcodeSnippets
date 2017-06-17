// IDECodeSnippetTitle: View Presenter template
// IDECodeSnippetCompletionPrefix: swift_view-presenter-implementation
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: View Presenter template with setView and start method
protocol <#ViewName#>View: class {
		}
		
		protocol <#PresenterName#>Presenter {
		    func setView(_ view: <#ViewName#>View)
		    func start()
		}
		
		final class <#PresenterName#>Implementation: <#PresenterName#> {
		    weak var output: <#ViewName#>View!
		
		    func setView(_ view: <#ViewName#>View) {
		        self.output = output
		    }
		
		    func start() {
		
		    }
		}
		
	
