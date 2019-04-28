import UIKit
import HybridCamLib

open class ToggleButton: RoundButton, ToggleButtonKind{
   open var toggle: Bool = false
   public var onToggle: OnToggle = defaultOnToggle
}
/**
 * Interaction
 */
extension ToggleButton {
   /**
    * This is fired then the user presses the button
    */
   override open func buttonTouched(sender: UIButton) {
      toggle.toggle()
      onToggle(toggle)
   }
}
