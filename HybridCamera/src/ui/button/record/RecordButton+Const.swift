import UIKit
import With
/**
 * Utility
 */
extension RecordButton{
   /**
    * Adds shadow to PARAM view
    */
   public static func addShadowToView(_ view: UIView){
      with(view.layer){
         $0.shadowColor = UIColor.black.cgColor
         $0.shadowOffset = .zero
         $0.shadowRadius = 3
         $0.shadowOpacity = 0.25
         $0.masksToBounds = false
      }
   }
}
/**
 * Size/Alignment
 */
extension RecordButton{
   open class var size:CGSize { return .init(width:80,height:80) }
   open class var cornerRadius:CGFloat {return RecordButton.size.width/2}
   /**
    * Positions the RecordButton center bottom of the screen
    */
   @objc open func setPosition(){
      self.frame = RecordButton.rect
   }
   /**
    * The position of the recordButton (Not using AutoLayout)
    */
   open class var rect:CGRect {
      let btnWidth:CGFloat = RecordButton.size.width
      let bottomCenter:CGPoint = {
         let rect:CGRect = UIScreen.main.bounds
         let bottomMargin:CGFloat = 20
         return .init(x: rect.midX-(btnWidth/2), y: rect.height - btnWidth - bottomMargin)
      }()
      let rect:CGRect = .init(x:bottomCenter.x, y:bottomCenter.y, width:btnWidth, height:btnWidth)
      return rect
   }
}
