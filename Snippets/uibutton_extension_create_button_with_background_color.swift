// IDECodeSnippetTitle: UIButton extension create button with background color
// IDECodeSnippetCompletionPrefix: swift_ui_button-background-extension
// IDECodeSnippetCompletionScopes: All
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Creates button with background for state
import UIKit

extension UIButton {
    
    func setBackgroundColor(_ color: UIColor, forState: UIControlState) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(UIColor.clear.cgColor)
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
}
