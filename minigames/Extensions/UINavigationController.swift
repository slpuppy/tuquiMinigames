import UIKit

extension UINavigationController {
    open override var prefersStatusBarHidden: Bool {
        return navigationController?.isNavigationBarHidden == true
    }
    
   open override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    
    func activeHidesBarsOnTap() {
        self.hidesBarsOnTap = true
    }
}
