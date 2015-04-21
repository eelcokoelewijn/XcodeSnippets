// IDECodeSnippetTitle: Set back button title
// IDECodeSnippetCompletionPrefix: objc_back-button
// IDECodeSnippetCompletionScopes: CodeBlock
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
    //set back button in bar
	    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
	                                initWithTitle:NSLocalizedString(@"NavigationBack", nil)
	                                style:UIBarButtonItemStyleBordered
	                                target:self
	                                action:nil];
	    self.navigationItem.backBarButtonItem = btnBack;
	
