// IDECodeSnippetTitle: Swift lazy UI-button var
// IDECodeSnippetCompletionPrefix: swift_lazy-ui-button-var
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Swift lazy UIButton variable creation
private lazy var <#var-name#>Button: UIButton = {
	    let <#var-name#> = UIButton(type: UIButtonType.roundedRect)
	    <#var-name#>.translatesAutoresizingMaskIntoConstraints = false
	    <#var-name#>.setTitleColor(.blue, for: .normal)
	    <#var-name#>.setTitleColor(.gray, for: .highlighted)
	    <#var-name#>.layer.borderColor = UIColor.blue.cgColor
	    return <#var-name#>
	}()
	
	func set<#var-name#>ButtonTarget(_ target: Any?, action: Selector) {
	    <#var-name#>Button.addTarget(target, action: action, for: .touchUpInside)
	}
	
	func set<#var-name#>ButtonTitle(_ title: String, for controlState: UIControlState) {
	    <#var-name#>Button.setTitle(title, for: controlState)
	}
	
