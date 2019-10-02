import UIKit
import HybridCamLib
import With
/**
 * - Fixme: add support for ultrawide angel aka 0.5x
 * - Fixme: Add support for detecting which angels are available
 */
open class ZoomSwitcher: ToggleButton, ZoomSwitcherKind {
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
