import UIKit

open class RecordButton:UIView{
   /*Interaction Callbacks*/
   open var onShortPressRelease:ShortPressReleased = RecordButton.defaultShortPressReleased
   open var onLongPressBegan:LongPressBegan = RecordButton.defaultLongPressBegan
   open var onLongPressRelease:LongPressReleased = RecordButton.defaultLongPressReleased
   /*UI*/
   open lazy var circle:Circle = createCircle()
   override init(frame: CGRect) {
      super.init(frame: RecordButton.rect)
      _ = circle/*Create the circle designs*/
      addGestureRecognizer()
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
