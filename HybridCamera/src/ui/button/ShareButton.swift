import UIKit
import HybridCamLib

open class ShareButton:UIButton,ClickButtonKind{
   open var onClick:OnClick = ShareButton.defaultOnClick
   override public init(frame: CGRect) {
      super.init(frame: frame)
      configButton()
      self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)/*Attach button action*/
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Interaction
 */
extension ClickButton{
   /**
    * Called from touchUpInside
    */
   @objc open func buttonTouched(sender:UIButton) {
      onClick()
   }
}

/**
 * Style
 */
extension ShareButton{
   /**
    * Config the button
    */
   @objc open func configButton(){
      self.backgroundColor = .white
      self.setTitleColor(.black, for: .normal)
      self.titleLabel?.font =  .systemFont(ofSize: 14)
      self.setTitle("Share", for: .normal)
      self.layer.cornerRadius = frame.height/2
   }
}
