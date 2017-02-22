// IDECodeSnippetTitle: View containing label with button
// IDECodeSnippetCompletionPrefix: swift_view-with-label-button
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: View containing label with button vertical aligned
final class <#view-class-name#>: UIView {
    private lazy var <#label-var-name#>: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var <#button-var-name#>: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    private func setupViews() {
        addSubview(<#label-var-name#>)
        addSubview(<#button-var-name#>)
    }
    
    private func applyViewConstraints() {
        let views: [String: Any] = ["label": <#label-var-name#>,
                     "button": <#button-var-name#>]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[button]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]-[button]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
    }
}
