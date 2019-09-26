import UIKit
import HybridCamLib
/**
 * Create
 */
extension TopBar {
   /**
    * Create exit button
    */
   open func createExitButton() -> ClickButtonKind {
      let btn = ExitButton()
      self.addSubview(btn)
      return btn
   }
   /**
    * Create flash button
    */
   open func createFlashButton() -> ToggleButtonKind {
      let btn = FlashButton()
      self.addSubview(btn)
      return btn
   }
   /**
    * Create flip button
    */
   open func createFlipButton() -> ToggleButtonKind {
      let btn = FlipButton()
      self.addSubview(btn)
      return btn
   }
}
