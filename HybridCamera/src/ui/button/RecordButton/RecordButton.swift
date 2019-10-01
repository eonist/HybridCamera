import UIKit
import HybridCamLib

open class RecordButton: UIView, RecordButtonKind {
   // Starting point for long-press to zoom
   open var startingPoint: CGPoint = .zero
   // Interaction call-back variables
   open var onShortPressRelease: ShortPressReleased = defaultShortPressReleased
   open var onLongPressBegan: LongPressBegan = defaultLongPressBegan
   open var onLongPressRelease: LongPressReleased = defaultLongPressReleased
   open var onLongPressChanged: LongPressChanged = defaultLongPressChanged
   // UI
   open lazy var circle: Circle = createCircle()
   override init(frame: CGRect) {
      super.init(frame: RecordButton.rect)
      _ = circle // Create the circle designs
      addGestureRecognizer()
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
