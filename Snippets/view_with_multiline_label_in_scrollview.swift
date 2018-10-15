// IDECodeSnippetTitle: View with multiline label in scrollview
// IDECodeSnippetCompletionPrefix: swift_scrollview-multiline-label
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: View with multiline label in scrollview
import UIKit

final class <#name-of-view#>View: UIScrollView {
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        return view
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
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

private extension <#name-of-view#>View {
    func setupViews() {
        backgroundColor = .white
        addSubview(contentView)
        contentView.addSubview(label)
    }

    func applyViewConstraints() {
        let views: [String: Any] = ["label": label,
                                    "self": self,
                                    "contentView": contentView]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[contentView(==self)]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[contentView]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views))
    }
}