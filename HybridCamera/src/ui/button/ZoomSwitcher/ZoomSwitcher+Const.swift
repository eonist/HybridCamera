import UIKit

extension ZoomSwitcher {
   /**
    * The position of the recordButton (Not using AutoLayout)
    */
   open class var rect: CGRect {
      let size: CGSize = .init(width: 40, height: 40)
      let x: CGFloat = {
         // similar to flash
         0
      }()
      let y: CGFloat = {
         //center of record button
         0
      }()
      let bottomCenter: CGPoint = {
         let rect: CGRect = UIScreen.main.bounds
         let bottomMargin: CGFloat = 20
         return .init(x: rect.midX - (size.width / 2), y: rect.height - size.height - bottomMargin)
      }()
      return .init(x: bottomCenter.x, y: bottomCenter.y, width: size.width, height: size.height)
   }
}
