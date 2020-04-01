import UIKit
import With
/**
 * - Fixme: ⚠️️ Add support for ultrawide angel aka 0.5x
 * - Fixme: ⚠️️ Add support for detecting which angels are available
 */
open class ZoomSwitcerBtn: ToggleButton, ZoomSwitchBtnKind {
   override init(frame: CGRect) {
      super.init(frame: frame)
      configButton()
   }
   /**
    * Boilerplate
    */
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
