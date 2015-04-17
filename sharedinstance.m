// IDECodeSnippetTitle: sharedInstance
// IDECodeSnippetCompletionPrefix: shrdinstnc
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
+ (<#class name#> *)sharedInstance
{
    static dispatch_once_t pred;
    static <#class name#> *sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
