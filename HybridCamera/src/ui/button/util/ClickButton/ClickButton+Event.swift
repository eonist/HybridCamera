import UIKit
/**
 * Interaction
 */
extension ClickButton {
   /**
    * This is fired then the user presses the button
    */
   override open func buttonTouched(sender: UIButton) {
      onClick()
   }
}
