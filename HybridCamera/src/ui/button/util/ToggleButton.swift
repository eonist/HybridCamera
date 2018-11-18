import UIKit
import HybridCamLib

open class ToggleButton:RoundButton,ToggleButtonKind{
   open var toggle:Bool = false
   public var onToggle:OnToggle = defaultOnToggle
   override public init(frame: CGRect) {
      super.init(frame: frame)
   }
   override open func buttonTouched(sender: UIButton) {
      toggle = !toggle
      onToggle(toggle)
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

