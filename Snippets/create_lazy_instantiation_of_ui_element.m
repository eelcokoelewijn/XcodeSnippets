// IDECodeSnippetTitle: Create lazy instantiation of ui element
// IDECodeSnippetCompletionPrefix: objc_ui-lazy-property
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetSummary: 
- (<#classname#> * _Nonnull)<#uiElementName#> {
    if (!_<#uiElementName#>) {
        _<#uiElementName#> = [[<#className#> alloc] initWithFrame:CGRectZero];
        _<#uiElementName#>.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _<#uiElementName#>;
}
