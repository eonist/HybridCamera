import UIKit
/**
 * Button that is rounded
 */
open class RoundButton:UIButton{
   override public init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .gray
      self.setTitleColor(.black, for: .normal)
      self.titleLabel?.font =  .systemFont(ofSize: 12)
      self.layer.cornerRadius = frame.width/2
      self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
   }
   @objc open func buttonTouched(sender:UIButton) {
      /*override in subclass*/
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

