// IDECodeSnippetTitle: FlowController
// IDECodeSnippetCompletionPrefix: swift_flowcontroller-base-impl
// IDECodeSnippetCompletionScopes: TopLevel
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Swift
// IDECodeSnippetSummary: FlowController base implementation
import Foundation
	
	protocol FlowController: class {
	    var childFlowController: [FlowController] { get set }
	}
	
	extension FlowController {
	    func add(childFlowController child: FlowController) {
	        childFlowController.append(child)
	    }
	    
	    func remove(childFlowController child: FlowController) {
	        childFlowController = childFlowController.filter { flowController in
	            flowController !== child
	        }
	    }
	    
	    public subscript(index: Int) -> FlowController {
	        get {
	            return childFlowController[index]
	        }
	        
	        set {
	            childFlowController[index] = newValue
	        }
	    }
	}
	
