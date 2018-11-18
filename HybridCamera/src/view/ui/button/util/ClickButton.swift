import UIKit

open class ClickButton:RoundButton{
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
/**
 * CallBack related
 */
extension ClickButton{
   public typealias OnClick = () -> Void
   public static let defaultOnClick:OnClick = { Swift.print("Default onClick()")}
}
