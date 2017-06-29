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
	    var <#name#>Presenter: <#protocol-presenter-name#>Presenter { get }
	}
	
	class Mixin<#protocol-presenter-name#>Presenter: <#protocol-presenter-name#>Presenter {
		weak var view: <#ViewName#>View?
	    func start() {
	
		}
	
		func setView(_ view: <#protocol-view-name#>View) {
	        self.view = view
		}
	}
	
	final <#ViewName#>ViewController: UIViewController, <#ViewName#>View, Uses<#protocol-presenter-name#>Presenter {
		let <#name#>Presenter: <#protocol-presenter-name#>Presenter
		private lazy var moduleView: <#name#>ModuleView = <#name#>ModuleView()
	
		init(presenter: <#protocol-presenter-name#>Presenter) {
			<#name#>Presenter = presenter
			super.init(nibName: nil, bundle: nil)
	        <#name#>Presenter.setView(self)
		}
	
		required init?(coder aDecoder: NSCoder) {
	        fatalError("init(coder:) has not been implemented")
	    }
	
	    override func loadView() {
	        super.loadView()
	        view = moduleView
	    }
	}
	
