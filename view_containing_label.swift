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
			    
			    private func setupViews() {
			        addSubview(<#var-name#>)
			    }
			    
			    private func applyViewConstraints() {
			        let views: [String: Any] = ["label": <#var-name#>]
			    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|",
			                                                                   options: [],
			                                                                   metrics: nil,
			                                                                   views: views))
			        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|",
			                                                                   options: [],
			                                                                   metrics: nil,
			                                                                   views: views))
			    }
			}
			
		
	
