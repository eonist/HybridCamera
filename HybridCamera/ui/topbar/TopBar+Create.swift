import UIKit
import With
/**
 * Create
 */
extension TopBar {
   /**
    * Create exit button
    */
   open func createExitButton() -> ClickButtonKind {
      with(ExitButton()) { self.addSubview($0) }
   }
   /**
    * Create flash button
    */
   open func createFlashButton() -> ToggleButtonKind {
      with(FlashButton()) { self.addSubview($0) }
   }
   /**
    * Create flip button
    */
   open func createFlipButton() -> ToggleButtonKind {
      with(FlipButton()) { self.addSubview($0) }
   }
}
