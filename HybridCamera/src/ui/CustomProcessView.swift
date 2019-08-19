import UIKit
import AVFoundation
import HybridCamLib
import With

open class CustomProcessView: ProcessView {} //Fixme: ⚠️️ Maybe rename to CustomProcessMediaView?
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
      let frame: CGRect = {
         let size: CGSize = .init(width: 180, height: 40)
         let margin: CGFloat = 40
         let point: CGPoint = .init(x: UIScreen.main.bounds.width / 2 - size.width / 2, y: UIScreen.main.bounds.height - margin - size.height)
         return .init(origin: point, size: size)
      }()
      return with(ShareButton(frame: frame)) {
         self.addSubview($0)
      }
   }
}
