// IDECodeSnippetTitle: Codable init from decoder
// IDECodeSnippetCompletionPrefix: swift_codable-decoder-init
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Codable decoder from initializer
init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: <#CodingKeys#>.self)
    <#var-name#> = try values.decode(<#VarType#>.self, forKey: .<#codingKeyCase#>)
    
    let <#var-name#>Nested = try values.nestedContainer(keyedBy: <#NestedCodingKeys#>.self, forKey: .<#nestedCodingKeyCase#>)
    let <#var-name#> = try <#var-name#>Nested.decode(<#VarType#>.self, forKey: .<#nestedCodingKeyCase#>)
}
