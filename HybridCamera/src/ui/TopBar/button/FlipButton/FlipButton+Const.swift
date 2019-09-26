import UIKit
/**
 * Constants
 */
extension FlipButton {
   /**
    * Size and position
    */
   static var rect: CGRect {
      let btnWidth: CGFloat = 30
      let topCenter: CGPoint = {
         let rect = UIScreen.main.bounds
         let margin: CGFloat = 40
         return .init(x: (rect.width / 2) - (btnWidth / 2), y: 0 + margin)
      }()
      return .init(x: topCenter.x, y: topCenter.y, width: btnWidth, height: btnWidth)
   }
}
