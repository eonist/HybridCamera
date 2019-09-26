import UIKit
/**
 * Constants (Size and position)
 */
extension FlashButton {
   public static var rect: CGRect {
      let btnWidth: CGFloat = 30
      let topRight: CGPoint = {
         let rect = UIScreen.main.bounds
         let margin: CGFloat = 40
         return .init(x: rect.width - btnWidth - margin, y: 0 + margin)
      }()
      return .init(x: topRight.x, y: topRight.y, width: btnWidth, height: btnWidth)
   }
}
