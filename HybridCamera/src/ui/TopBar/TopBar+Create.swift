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
      return with(ExitButton()) { self.addSubview($0) }
   }
   /**
    * Create flash button
    */
   open func createFlashButton() -> ToggleButtonKind {
      return with(FlashButton()) { self.addSubview($0) }
   }
   /**
    * Create flip button
    */
   open func createFlipButton() -> ToggleButtonKind {
      return with(FlipButton()) { self.addSubview($0) }
   }
}
