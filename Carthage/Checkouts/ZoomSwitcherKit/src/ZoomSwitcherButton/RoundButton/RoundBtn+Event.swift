import UIKit
/**
 * Interaction
 */
extension RoundBtn {
   /**
    * This is fired then the user presses the button
    */
   @objc open func buttonTouched(sender: UIButton) {
      Swift.print("RoundButton - override in subclass")
   }
}
