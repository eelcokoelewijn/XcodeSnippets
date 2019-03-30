// IDECodeSnippetTitle: AppDelegate didFinishLaunching
// IDECodeSnippetCompletionPrefix: objc_app-did-finish-implementation
// IDECodeSnippetCompletionScopes: CodeBlock
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetSummary: 
self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
<#classname#> *rootVC = [[<#classname#> alloc] init];
UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
[[self window] setRootViewController:navVC];
[self.window makeKeyAndVisible];
