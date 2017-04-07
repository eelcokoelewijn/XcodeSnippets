// IDECodeSnippetTitle: ViewModel template
// IDECodeSnippetCompletionPrefix: swift_viewmodel-implementation
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: ViewModel template with output and base methods
protocol <#ViewModelName#>Output: class {
}

protocol <#ViewModelName#>ViewModel {
    func setOutput(_ output: <#ViewModelName#>Output)
    func start()
}

final class <#ViewModelName#>Implementation: <#ViewModelName#> {
    weak var output: <#ViewModelName#>Output!
    
    func setOutput(_ output: <#ViewModelName#>Output) {
        self.output = output
    }
    
    func start() {
        
    }
}
