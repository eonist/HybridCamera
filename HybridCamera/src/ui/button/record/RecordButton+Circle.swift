import UIKit

extension RecordButton{
   /**
    * Circle class (Creates RecordButton)
    */
   open class Circle:UIView{
      open lazy var inner:UIView = self.createInnerCircle()
      open lazy var outer:UIView = self.createOuterCircle()
      override init(frame: CGRect) {
         super.init(frame: frame)
         _ = inner
         _ = outer
         //do this on didLayout instead, as you dont have frame when using AutoLayout
      }
      /**
       * Boilerplate
       */
      required public init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
      }
      /**
       * Creates inner circle
       */
      @objc open func createInnerCircle() -> UIView{
         let padding = self.frame.width/12
         let length = self.frame.width - (padding * 2)
         let frame = CGRect.init(origin: CGPoint.init(x: padding, y: padding), size: CGSize.init(width: length, height: length))
         let circle = UIView.init(frame: frame)
         circle.backgroundColor = .white
         circle.layer.cornerRadius = length/2
         addSubview(circle)
         return circle
      }
      /**
       * Creates outer circle
       */
      @objc open func createOuterCircle() -> UIView{
         let circle:UIView = .init(frame: self.frame)
         circle.layer.borderWidth = 3
         circle.layer.borderColor = UIColor.white.cgColor
         circle.layer.cornerRadius = self.frame.width/2
         addSubview(circle)
         return circle
      }
   }
   /**
    * Creates circle
    */
   @objc open func createCircle() -> RecordButton.Circle{
      let circle = RecordButton.Circle.init(frame: RecordButton.Circle.rect)
      RecordButton.addShadowToView(circle)
      addSubview(circle)
      return circle
   }
}
/**
 * Extension
 */
extension RecordButton.Circle{
   open class var rect:CGRect {return CGRect.init(origin: CGPoint(x:0,y:0), size: CGSize.init(width: RecordButton.size.width, height: RecordButton.size.height))}
}
