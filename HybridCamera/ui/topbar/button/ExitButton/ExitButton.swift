import UIKit

open class ExitButton: ClickButton {
   override public init(frame: CGRect) {
      let rect = ExitButton.rect
      super.init(frame: rect)
      self.backgroundColor = .clear
      self.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
