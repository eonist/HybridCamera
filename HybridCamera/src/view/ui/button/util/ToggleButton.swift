import UIKit

open class ToggleButton:RoundButton{
   open var toggle:Bool = false
   var onToggle:OnToggle = defaultOnToggle
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
/**
 * CallBack related
 */
extension ToggleButton{
   public typealias OnToggle = (_ toggle:Bool) -> Void
   public static let defaultOnToggle:OnToggle = { toggle in Swift.print("Default onToggle: \(toggle)")}
}

