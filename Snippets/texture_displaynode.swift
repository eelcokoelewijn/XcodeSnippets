// IDECodeSnippetTitle: Texture DisplayNode
// IDECodeSnippetCompletionPrefix: swift_texture_display_node
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: ASDisplayNode template
final class <#nodeName#>Node: ASDisplayNode {
    lazy var textNode: ASTextNode = {
        let t = ASTextNode()
        return t
    }()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        super.layoutSpecThatFits(constrainedSize)
        let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), child: textNode)
        return insetSpec
    }
}
