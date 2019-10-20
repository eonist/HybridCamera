import Foundation
import ZoomSwitcherKit
import HybridCamLib

extension ZoomSwitcher: ZoomSwitcherKind {}
extension ZoomSwitcher {
   /**
    * The position of the recordButton (Not using AutoLayout)
    */
   open class func getRect(size: CGSize) -> CGRect {
//      let size: CGSize = .init(width: 40, height: 40)
      let x: CGFloat = {
         let rect = UIScreen.main.bounds
//         let margin: CGFloat = 40
         return (rect.width / 4 * 3) - (size.width / 2)
      }()
      let y: CGFloat = {
         let rect: CGRect = UIScreen.main.bounds
         let bottomMargin: CGFloat = 20
         let size: CGSize = RecordButton.rect.size
         return rect.height - size.height / 2 - bottomMargin
      }()
      let bottomRight: CGPoint = .init(x: x, y: y - size.height / 2)
      return .init(x: bottomRight.x, y: bottomRight.y, width: size.width, height: size.height)
   }
}
