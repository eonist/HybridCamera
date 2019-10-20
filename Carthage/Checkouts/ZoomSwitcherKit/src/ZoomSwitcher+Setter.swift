import UIKit
import With
/**
 * Setter
 */
extension ZoomSwitcher {
   /**
    * Style the background
    */
   @objc open func styleBackground() {
      with(self) {
         $0.backgroundColor = ZoomSwitcher.style.backgroundColor
         $0.layer.cornerRadius = frame.height / 2
      }
   }
}
