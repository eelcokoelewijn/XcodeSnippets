// IDECodeSnippetTitle: View with multiline label in scrollview
// IDECodeSnippetCompletionPrefix: swift_scrollview-multiline-label
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: View with multiline label in scrollview
import UIKit
	
	final class <#name-of-view#>View: UIScrollView {
	    private lazy var <#label-name#>: UILabel = {
	        let l = UILabel()
	        l.translatesAutoresizingMaskIntoConstraints = false
	        l.lineBreakMode = .byWordWrapping
	        l.numberOfLines = 0
	        return l
	    }()
	
	    private lazy var contentView: UIView = {
	        let v = UIView()
	        v.translatesAutoresizingMaskIntoConstraints = false
	        return v
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
	        <#label-name#>.text = text
	    }
	
	    private func setupViews() {
	        backgroundColor = .white
	        addSubview(contentView)
	        contentView.addSubview(<#label-name#>)
	    }
	
	    private func applyViewConstraints() {
	        let views: [String: Any] = ["label": <#label-name#>,
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
