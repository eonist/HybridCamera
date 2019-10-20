import Foundation
import With

open class ZoomSwitcherButton: ToggleBtn {
   override open var toggle: Bool { didSet { setToggle(toggle: toggle) } }
   override public init(frame: CGRect) {
		super.init(frame: frame)
      configButton(style: ZoomSwitcherButton.off)
	}
   /**
    * Boilerplate
    */
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
