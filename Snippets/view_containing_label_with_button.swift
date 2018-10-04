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
	        let b = UIButton(type: .roundedRect)
	        b.layer.cornerRadius = 5
	        b.layer.borderWidth = 1
	        b.layer.borderColor = UIColor.black.cgColor
	        b.setTitleColor(.black, for: .normal)
	    b.translatesAutoresizingMaskIntoConstraints = false
	        return b
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
	            <#label-var-name#>.text = text
	            <#button-var-name#>.setTitle(title, for: .normal)
	    }
	
	    func <#button#>Add(target: Any?, action: Selector, for: UIControlEvents) {
	        <#button#>.addTarget(target, action: action, for: .touchUpInside)
	    }
	
	    private func setupViews() {
	        backgroundColor = .white
	        addSubview(<#label-var-name#>)
	        addSubview(<#button-var-name#>)
	    }
	
	    private func applyViewConstraints() {
	        let views: [String: Any] = ["label": <#label-var-name#>,
	                     "button": <#button-var-name#>]
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
