import UIKit
import With
/**
 * Interaction
 */
extension ZoomSwitcher {
   /**
    * Called from touchUpInside
    */
   @objc override open func buttonTouched(sender: UIButton) {
      super.buttonTouched(sender: sender)
      with(self) {
         let text: String = toggle ? "2x" : "1x"
         $0.setTitle(text, for: .normal)
         $0.layer.cornerRadius = frame.height / 2
      }
   }
}
