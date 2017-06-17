// IDECodeSnippetTitle: Create lazy instantiation of ui element
// IDECodeSnippetCompletionPrefix: objc_lazy-UI-element
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetSummary: 
- (<#classname#> *)<#uiElementName#>
				{
				    if (!_<#uiElementName#>) {
			            _<#uiElementName#> = [[<#className#> alloc] initWithFrame:CGRectZero];
				        _<#uiElementName#>.translatesAutoresizingMaskIntoConstraints = NO;
				    }
				    return _<#uiElementName#>;
				}
			
		
	
