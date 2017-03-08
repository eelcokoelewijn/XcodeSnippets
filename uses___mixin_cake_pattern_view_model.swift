// IDECodeSnippetTitle: Uses & Mixin cake pattern view model
// IDECodeSnippetCompletionPrefix: swift-view-model-uses-mixin-di
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Uses & Mixin cake pattern DI
protocol <#protocol-name-output#>: class {
	    
	}
	
	protocol <#protocol-name#> {
	    func start()
	    func setOutput(_ output: <#protocol-name-output#>)
	}
	
	protocol Uses<#protocol-name#> {
	    var <#protocol-instance-name#>: <#protocol-name#> { get }
	}
	
	class Mixin<#protocol-name#>: <#protocol-name#> {
	    
	}
	
