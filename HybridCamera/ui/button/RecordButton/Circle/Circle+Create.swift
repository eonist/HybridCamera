import UIKit
import With
/**
 * Create
 */
extension Circle {
   /**
    * Creates inner circle
    */
   @objc open func createInnerCircle() -> UIView {
      let (frame, length): (CGRect, CGFloat) = {
         let padding = self.frame.width / 12
         let length = self.frame.width - (padding * 2)
         let rect: CGRect = .init(origin: .init(x: padding, y: padding), size: .init(width: length, height: length))
         return (rect, length)
      }()
      return with(.init(frame: frame)) {
         $0.backgroundColor = .white
         $0.layer.cornerRadius = length / 2
         addSubview($0)
      }
   }
   /**
    * Creates outer circle
    */
   @objc open func createOuterCircle() -> UIView {
      with( .init(frame: self.frame) ) {
         $0.layer.borderWidth = 3
         $0.layer.borderColor = UIColor.white.cgColor
         $0.layer.cornerRadius = self.frame.width / 2
         addSubview($0)
      }
   }
}
