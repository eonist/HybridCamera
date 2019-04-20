import UIKit
import With
/*
 * TODO: move Circle out of RecordButton scope
 */
extension RecordButton{
   /**
    * Circle class (Creates RecordButton)
    * - TODO: ⚠️️ Do this on didLayout instead, as you dont have frame when using AutoLayout
    */
   open class Circle:UIView{
      open lazy var inner:UIView = self.createInnerCircle()
      open lazy var outer:UIView = self.createOuterCircle()
      override init(frame: CGRect) {
         super.init(frame: frame)
         _ = inner
         _ = outer
      }
      /**
       * Boilerplate
       */
      @available(*, unavailable)
      required public init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
      }
   }
}
/**
 * Create
 */
extension RecordButton.Circle{
   /**
    * Creates inner circle
    */
   @objc open func createInnerCircle() -> UIView{
      let frame:CGRect = {
         let padding = self.frame.width/12
         let length = self.frame.width - (padding * 2)
         return .init(origin: .init(x: padding, y: padding), size: .init(width: length, height: length))
      }()
      return with(.init(frame: frame)) {
         $0.backgroundColor = .white
         $0.layer.cornerRadius = length/2
         addSubview($0)
      }
   }
   /**
    * Creates outer circle
    */
   @objc open func createOuterCircle() -> UIView{
      return with( .init(frame: self.frame) ) {
         $0.layer.borderWidth = 3
         $0.layer.borderColor = UIColor.white.cgColor
         $0.layer.cornerRadius = self.frame.width/2
         addSubview($0)
      }
   }
   /**
    * Creates circle
    */
   @objc open func createCircle() -> RecordButton.Circle{
      return with(.init(frame: RecordButton.Circle.rect)) {
         RecordButton.addShadowToView($0)
         addSubview($0)
      }()
   }
}
/**
 * Extension
 */
extension RecordButton.Circle {
   open class var rect:CGRect {return .init(origin: .init(x:0,y:0), size: .init(width: RecordButton.size.width, height: RecordButton.size.height))}
}
