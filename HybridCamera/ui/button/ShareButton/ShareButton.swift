import UIKit
import With

open class ShareButton: UIButton, ClickButtonKind {
   open var onClick: OnClick = ShareButton.defaultOnClick
   override public init(frame: CGRect) {
      super.init(frame: frame)
      configButton()
      self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside) // Attach button action
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
