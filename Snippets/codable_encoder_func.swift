// IDECodeSnippetTitle: Codable encoder func
// IDECodeSnippetCompletionPrefix: swift_codable-encode-function
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Codable encode to encoder function
func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: <#CodingKeys#>.self)
    try container.encode(<#varName#>, forKey: .<#codingKeyCase#>)
    var <#varNestedContainer#> = container.nestedContainer(keyedBy: <#NestedCodingKeys#>.self, forKey: .<#nestedCodingKeyCase#>)
    try <#varNestedContainer#>.encode(<#varName#>, forKey: .<#codingKeyCase#>)
}
