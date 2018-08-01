// IDECodeSnippetTitle: Print filename and function
// IDECodeSnippetCompletionPrefix: swift_print-filename-function
// IDECodeSnippetCompletionScopes: All
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Print filename and function
print("\(#file.components(separatedBy: "/").last ?? "")->\(#function)")
