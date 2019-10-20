import UIKit

extension ShareButton {
   /**
    * Size and position of button
    */
   static let rect: CGRect = {
      let size: CGSize = .init(width: 180, height: 40)
      let margin: CGFloat = 40
      let point: CGPoint = {
         let x = UIScreen.main.bounds.width / 2 - size.width / 2
         let y = UIScreen.main.bounds.height - margin - size.height
         return .init(x: x, y: y)
      }()
      return .init(origin: point, size: size)
   }()
}
