import UIKit

open class TopBar:UIView{
   open lazy var exitButton:ExitButton = createExitButton()
   open lazy var flipButton:FlipButton = createFlipButton()
   open lazy var flashButton:FlashButton = createFlashButton()
   override public init(frame:CGRect){
      super.init(frame: frame)
      _ = exitButton
      _ = flipButton
      _ = flashButton
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension TopBar{
   open func createExitButton() -> ExitButton{
      let btn = ExitButton()
      self.addSubview(btn)
      return btn
   }
   open func createFlashButton() -> FlashButton{
      let btn = FlashButton()
      self.addSubview(btn)
      return btn
   }
   open func createFlipButton() -> FlipButton{
      let btn = FlipButton()
      self.addSubview(btn)
      return btn
   }
}
