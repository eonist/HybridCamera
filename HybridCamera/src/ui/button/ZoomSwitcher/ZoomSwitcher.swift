import UIKit
import HybridCamLib
import With

open class ZoomSwitcher: UIButton, ZoomSwitcherKind {
   open var onClick: OnClick = ShareButton.defaultOnClick
   override init(frame: CGRect) {
      super.init(frame: frame)
      configButton()
      self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)/*Attach button action*/
   }
   /**
    * Boilerplate
    */
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
