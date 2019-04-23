import UIKit
import HybridCamLib
import With
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
   @available(*, unavailable)
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Interaction
 */
extension ShareButton{
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
      with(self){
         $0.backgroundColor = .white
         $0.setTitleColor(.black, for: .normal)
         $0.titleLabel?.font =  .systemFont(ofSize: 14)
         $0.setTitle("Share", for: .normal)
         $0.layer.cornerRadius = frame.height/2
      }
   }
}
