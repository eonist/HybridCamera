import UIKit
import HybridCamLib

open class ClickButton:RoundButton,ClickButtonKind{
   public var onClick:OnClick = defaultOnClick
   override init(frame: CGRect) {
      super.init(frame: frame)
   }
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   override open func buttonTouched(sender: UIButton) {
      onClick()
   }
}
