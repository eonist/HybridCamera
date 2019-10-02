import UIKit
import AVFoundation
import HybridCamLib
import With
/**
 * - Fixme: ⚠️️ Maybe rename to CustomProcessMediaView?
 */
open class CustomProcessView: ProcessView {}
/**
 * Extension
 */
extension CustomProcessView {
   /**
    * Creates exit button
    */
   @objc override open func createExitButton() -> ClickButtonKind {
      let btn = ExitButton()
      self.addSubview(btn)
      return btn
   }
   /**
    * Creates share button
    */
   @objc override open func createShareButton() -> ClickButtonKind {
      return with(ShareButton(frame: ShareButton.rect)) {
         self.addSubview($0)
      }
   }
}
