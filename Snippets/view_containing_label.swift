// IDECodeSnippetTitle: View containing label
// IDECodeSnippetCompletionPrefix: swift_view-with-label
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: View containing label set to all edges
final class <#view-name#>: UIView {
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        applyViewConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(labelWithText text: String) {
        label.text = text
    }
}

private extension <#view-name#> {
    func setupViews() {
        backgroundColor = .white
        addSubview(label)
    }

    func applyViewConstraints() {
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: self.topAnchor)])
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: self.leadingAnchor)])
        NSLayoutConstraint.activate([label.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        NSLayoutConstraint.activate([label.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
