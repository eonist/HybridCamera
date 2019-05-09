import UIKit
import HybridCamLib

open class ClickButton: RoundButton, ClickButtonKind {
   public var onClick: OnClick = defaultOnClick
}
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
