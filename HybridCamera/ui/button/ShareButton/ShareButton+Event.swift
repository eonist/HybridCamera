import UIKit
/**
 * Interaction
 */
extension ShareButton {
   /**
    * Called from touchUpInside
    */
   @objc open func buttonTouched(sender: UIButton) {
      onClick()
   }
}
