// IDECodeSnippetTitle: UIImage extension image with size and color
// IDECodeSnippetCompletionPrefix: swift_uiimage-color-extension
// IDECodeSnippetCompletionScopes: All
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: Creates image from color with given size
import UIKit
	
	public extension UIImage
	{
	    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1))
	    {
	        let rect = CGRect(origin: .zero, size: size)
	        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
	        color.setFill()
	        UIRectFill(rect)
	        let image = UIGraphicsGetImageFromCurrentImageContext()
	        UIGraphicsEndImageContext()
	        
	        guard let cgImage = image?.cgImage else { return nil }
	        self.init(cgImage: cgImage)
	    }
	}
