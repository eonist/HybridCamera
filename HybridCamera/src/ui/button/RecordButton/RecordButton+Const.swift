import UIKit
import With
/**
 * Size / Alignment
 */
extension RecordButton {
   open class var size: CGSize { return .init(width: 80, height: 80) }
   open class var cornerRadius: CGFloat { return RecordButton.size.width / 2 }
   /**
    * Positions the RecordButton center bottom of the screen
    */
   @objc open func setPosition() {
      self.frame = RecordButton.rect
   }
   /**
    * The position of the recordButton (Not using AutoLayout)
    */
   open class var rect: CGRect {
      let btnWidth: CGFloat = RecordButton.size.width
      let bottomCenter: CGPoint = {
         let rect: CGRect = UIScreen.main.bounds
         let bottomMargin: CGFloat = 20
         return .init(x: rect.midX - (btnWidth / 2), y: rect.height - btnWidth - bottomMargin)
      }()
      return .init(x: bottomCenter.x, y: bottomCenter.y, width: btnWidth, height: btnWidth)
   }
}
