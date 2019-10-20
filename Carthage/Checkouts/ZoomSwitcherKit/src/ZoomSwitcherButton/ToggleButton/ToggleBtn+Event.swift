import UIKit
/**
 * Interaction
 */
extension ToggleBtn {
   /**
    * This is fired then the user presses the button
    */
   override open func buttonTouched(sender: UIButton) {
      toggle.toggle()
      onToggle(self, toggle)
   }
}
