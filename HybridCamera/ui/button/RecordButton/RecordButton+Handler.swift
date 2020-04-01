import UIKit
import With

extension RecordButton {
   /**
    * Used to reset previously attached callbacks
    * - Note: should be called when views are animating between states, where all interaction should be disabled
    */
   @objc open func resetCallBacks() {
      onShortPressRelease = RecordButton.defaultShortPressReleased
      onLongPressBegan = RecordButton.defaultLongPressBegan
      onLongPressRelease = RecordButton.defaultLongPressReleased
      onLongPressChanged = RecordButton.defaultLongPressChanged
   }
   /**
    * Adds gesture listeners to button
    */
   @objc open func addGestureRecognizer() {
      let tap: UITapGestureRecognizer = .init(target: self, action: #selector(handleTap))
      self.addGestureRecognizer(tap)
      with(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))) { // holdGesture.delegate = self
         $0.cancelsTouchesInView = false
         $0.minimumPressDuration = 0.25
         $0.allowableMovement = 500
         self.addGestureRecognizer($0)
         tap.require(toFail: $0) // Cancels the shortTap from ever firing
      }
   }
}
