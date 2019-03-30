// IDECodeSnippetTitle: Swift lazy UI-button var
// IDECodeSnippetCompletionPrefix: swift_ui-lazy-button-var
// IDECodeSnippetCompletionScopes: ClassImplementation
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Swift lazy UIButton variable creation
private lazy var actionButton: UIButton = {
    let view = UIButton(type: UIButtonType.roundedRect)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setTitleColor(.blue, for: .normal)
    view.setTitleColor(.gray, for: .highlighted)
    view.layer.borderColor = UIColor.blue.cgColor
    return view
}()

func setviewButtonTarget(_ target: Any?, action: Selector) {
    actionButton.addTarget(target, action: action, for: .touchUpInside)
}

func setviewButtonTitle(_ title: String, for controlState: UIControlState) {
    actionButton.setTitle(title, for: controlState)
}
