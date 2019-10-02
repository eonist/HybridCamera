import UIKit
/**
 * Interaction
 */
extension ZoomSwitcher {
   /**
    * Called from touchUpInside
    */
   @objc open func buttonTouched(sender: UIButton) {
      onClick()
   }
}
