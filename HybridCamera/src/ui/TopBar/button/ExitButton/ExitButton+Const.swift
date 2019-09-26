import UIKit
/**
 * Constants
 */
extension ExitButton {
   /**
    * Metrics of Exit button (Not using AutoLayout)
    */
   public static var rect: CGRect {
      let btnWidth: CGFloat = 30
      let topLeft: CGPoint = {
         let margin: CGFloat = 40
         return .init(x: margin, y: margin)
      }()
      return .init(x:topLeft.x, y:topLeft.y, width:btnWidth, height:btnWidth)
   }
}
