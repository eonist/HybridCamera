import UIKit
import With
import CoreGraphics
/**
 * Gesture events
 */
extension RecordButton: UIGestureRecognizerDelegate {
   /**
    * Long press
    * - Note: We don't us a switch here because it will not be exhaustive
    */
   @objc open func handleLongPress(sender: UILongPressGestureRecognizer) {
      if [.ended, .cancelled, .failed].contains(sender.state) { // long tap release
         handleLongPressRelease()
      } else if case .began = sender.state { // long tap just began
         startingPoint = sender.location(in: sender.view)
         handleLongPressBegan()
      } else if case .changed = sender.state {
         let newP = sender.location(in: sender.view)
         let dist: CGFloat = hypot(startingPoint.x - newP.x, startingPoint.y - newP.y) // Needed to calculate distance from two CGPoints
         let additionalZoom: CGFloat = dist / 60 - 1
         if additionalZoom >= 0 && additionalZoom <= 6 {
            handleLongPressChanged(addZoom: additionalZoom)
         }
      }
   }
   /**
    * Normal tap
    * - Note: We dont us a switch here because it will not be exhaustive
    */
   @objc open func handleTap(sender: UITapGestureRecognizer) {
      if [.ended, .cancelled, .failed].contains(sender.state) { // short tap release
         handleShorPressRelease()
      }
   }
   /**
    * When the user short presses the button
    */
   @objc open func handleShorPressRelease() {
      onShortPressRelease()
   }
   /**
    * Note: this method is justified because its called from multiple places in this class etc
    */
   @objc open func handleLongPressBegan() {
      RecordButton.grow(view: self.circle.inner)
      onLongPressBegan()
   }
   /**
    * When the user releases a long press of the button
    */
   @objc open func handleLongPressRelease() {
      RecordButton.shrink(view: self.circle.inner)
      onLongPressRelease()
   }
   /**
    * When the user moves away from the button while long press
    */
   @objc open func handleLongPressChanged(addZoom: CGFloat) {
      onLongPressChanged(addZoom)
   }
}
