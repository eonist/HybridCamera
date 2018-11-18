import UIKit
import AVFoundation
import HybridCamLib

open class CustomProcessView:ProcessView {}//TODO: ⚠️️ Rename to CustomProcessMediaView
/**
 * Extension
 */
extension CustomProcessView{
   /**
    * Creates exit button
    */
   @objc open override func createExitButton() -> ClickButtonKind{
      let btn = ExitButton()
      self.addSubview(btn)
      return btn
   }
   /**
    * Creates share button
    */
   @objc open override func createShareButton() -> ClickButtonKind{
      let s = CGSize.init(width: 180, height: 40)
      let margin:CGFloat = 40
      let p = CGPoint.init(x: UIScreen.main.bounds.width/2 - s.width/2, y: UIScreen.main.bounds.height - margin - s.height)
      let btn = ShareButton.init(frame: CGRect.init(origin: p, size: s))
      self.addSubview(btn)
      return btn
   }
}
//
///**
// * Create
// */
//extension ProcessMediaView {
//
//}
