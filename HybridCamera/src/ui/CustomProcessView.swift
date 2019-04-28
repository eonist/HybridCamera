import UIKit
import AVFoundation
import HybridCamLib
import With

open class CustomProcessView: ProcessView {}//TODO: ⚠️️ Rename to CustomProcessMediaView
/**
 * Extension
 */
extension CustomProcessView {
   /**
    * Creates exit button
    */
   @objc open override func createExitButton() -> ClickButtonKind {
      let btn = ExitButton()
      self.addSubview(btn)
      return btn
   }
   /**
    * Creates share button
    */
   @objc open override func createShareButton() -> ClickButtonKind {
      let size: CGSize = .init(width: 180, height: 40)
      let margin: CGFloat = 40
      let point: CGPoint = .init(x: UIScreen.main.bounds.width / 2 - size.width / 2, y: UIScreen.main.bounds.height - margin - size.height)
      return with(ShareButton.init(frame: .init(origin: point, size: size))) {
         self.addSubview($0)
      }
   }
}

///**
// * Create
// */
//extension ProcessMediaView {
//
//}
