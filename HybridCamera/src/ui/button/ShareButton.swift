import UIKit

open class ShareButton:UIButton{
   open var onClick:OnClick = ShareButton.defaultOnClick
   override public init(frame: CGRect) {
      super.init(frame: frame)
      configButton()
      self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
   }
   /**
    * Called from touchUpInside
    */
   @objc open func buttonTouched(sender:UIButton) {
      onClick()
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * CallBack related
 */
extension ShareButton{
   public typealias OnClick = () -> Void
   public static let defaultOnClick = { Swift.print("Default onClick()") }
}
/**
 * Style related
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
