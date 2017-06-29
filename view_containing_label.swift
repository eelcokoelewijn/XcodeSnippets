// IDECodeSnippetTitle: View containing label
// IDECodeSnippetCompletionPrefix: swift_view-with-label
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: View containing label set to all edges
final class <#view-name#>: UIView {
				    private lazy var <#var-name#>: UILabel = {
				        let l = UILabel()
				        l.translatesAutoresizingMaskIntoConstraints = false
				        return l
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
                            <#label-var-name#>.text = text
                    }

				    private func setupViews() {
                        backgroundColor = .white
				        addSubview(<#var-name#>)
				    }
				    
				    private func applyViewConstraints() {
				        let views: [String: Any] = ["label"": <#var-name#>]
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
				
			
		
	
