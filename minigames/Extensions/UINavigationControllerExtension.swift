import UIKit

extension UINavigationController {
    
    open override var prefersStatusBarHidden: Bool { navigationController?.isNavigationBarHidden == true }
    
    open override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { UIStatusBarAnimation.slide }
    
    func activeHidesBarsOnTap() { self.hidesBarsOnTap = true }
}
