// IDECodeSnippetTitle: UI Setup & constraints helpers
// IDECodeSnippetCompletionPrefix: swift_ui-setup-helpers
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: UI setup methods
private func setupViews() {
    <#paretnView#>.addSubview(<#childView#>)
}

private func applyViewConstraints() {
    let views = ["<#label-name#>": <#view#>]
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "<#layout#>", options: [], metrics: nil, views: views))
    NSLayoutConstraint.activate([<#childView#>.<#anchor#>.constraint(equalTo: <#parentView#>.<#anchor#>)])
}
