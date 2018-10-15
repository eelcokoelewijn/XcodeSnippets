// IDECodeSnippetTitle: View containing label with button
// IDECodeSnippetCompletionPrefix: swift_view-with-label-button
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: View containing label with button vertical aligned
final class <#view-class-name#>: UIView {
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var button: UIButton = {
        let view = UIButton(type: .roundedRect)
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.setTitleColor(.black, for: .normal)
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

    func configure(labelWithText text: String, buttonTitle title: String) {
        label.text = text
        button.setTitle(title, for: .normal)
    }

    func buttonAdd(target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }

    private func setupViews() {
        backgroundColor = .white
        addSubview(label)
        addSubview(button)
    }

    private func applyViewConstraints() {
        let views: [String: Any] = ["label": label,
                     "button": button]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[button]-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[label]-[button]-(>=15)-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
    }
}
