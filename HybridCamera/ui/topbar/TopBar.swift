import UIKit

open class TopBar: UIView, TopBarKind {
   open lazy var exitButton: ClickButtonKind = createExitButton()
   open lazy var flipButton: ToggleButtonKind = createFlipButton()
   open lazy var flashButton: ToggleButtonKind = createFlashButton()
   override public init(frame: CGRect) {
      super.init(frame: frame)
      _ = exitButton
      _ = flipButton
      _ = flashButton
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
