// IDECodeSnippetTitle: View controller containment
// IDECodeSnippetCompletionPrefix: swift_viewcontroller-containment
// IDECodeSnippetCompletionScopes: CodeBlock
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Add child viewcontroller to parent view controller view
    let vc = <#viewcontroller#>
    addChildViewController(vc)
    <#parent-viewcontroller#>.view.addSubview(vc.view)
    <#viewcontroller#>.didMove(toParentViewController: <#parent-viewcontroller#>)
