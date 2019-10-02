import UIKit
import With
/**
 * Size / Alignment
 */
extension RecordButton {
   open class var cornerRadius: CGFloat { return RecordButton.rect.width / 2 }
   /**
    * The position of the recordButton (Not using AutoLayout)
    */
   open class var rect: CGRect {
      let size: CGSize = .init(width: 80, height: 80)
      let bottomCenter: CGPoint = {
         let rect: CGRect = UIScreen.main.bounds
         let bottomMargin: CGFloat = 20
         return .init(x: rect.midX - (size.width / 2), y: rect.height - size.height - bottomMargin)
      }()
      return .init(x: bottomCenter.x, y: bottomCenter.y, width: size.width, height: size.height)
   }
}
