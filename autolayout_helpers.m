// IDECodeSnippetTitle: Autolayout helpers
// IDECodeSnippetCompletionPrefix: 0bjc_al_setup-auto-layout
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetSummary: Setup auto layout helper views
#pragma mark - setup views

- (void)setupViews {
    [self.view addSubview:<#(nonnull UIView *)#>];
}

#pragma mark - layout constraints

- (void)setupViewConstraints {
    NSMutableArray* constraints = [NSMutableArray new];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:<#(nonnull UIView *)#>
                                                        attribute:<#NSLayoutAttribute#>
                                                        relatedBy:<#NSLayoutRelation#>
                                                           toItem:<#(nullable UIView *)#>
                                                        attribute:<#NSLayoutAttribute#>
                                                       multiplier:1
                                                         constant:0]];
    [NSLayoutConstraint activateConstraints:constraints];
}
