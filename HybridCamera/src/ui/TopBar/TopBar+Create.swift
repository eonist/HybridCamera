import UIKit
import HybridCamLib
import With
/**
 * Create
 */
extension TopBar {
   /**
    * Create exit button
    */
   open func createExitButton() -> ClickButtonKind {
      return with(ExitButton()) { self.addSubview(btn) }
   }
   /**
    * Create flash button
    */
   open func createFlashButton() -> ToggleButtonKind {
      return with(FlashButton()) { self.addSubview(btn) }
   }
   /**
    * Create flip button
    */
   open func createFlipButton() -> ToggleButtonKind {
      return with(FlipButton()) { self.addSubview(btn) }
   }
}
