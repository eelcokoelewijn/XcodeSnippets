// IDECodeSnippetTitle: UI Setup & constraints helpers
// IDECodeSnippetCompletionPrefix: swift-ui-setup-helpers
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: UI setup methods
private func setupViews() {
			    <#view#>.addSubview(<#view-to-add#>)
			}
			
			private func applyViewConstraints() {
			    let views = ["<#label-name#>": <#view#>]
			    var constraints: [NSLayoutConstraint] = []
			    constraints.append(NSLayoutConstraint(item: <#item#>,
			                                              attribute: <#attribute#>,
			                                    relatedBy: .equal,
			                                              toItem: <#toItem#>,
			                                              attribute: <#toAttribute#>,
			multiplier: 1, constant: 0))
			    NSLayoutConstraint.activate(constraints)
			    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "<#layout#>", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
			
			}
			
		
	
