import UIKit
import With
/**
 * Gesture recognizer
 */
extension RecordButton: UIGestureRecognizerDelegate {
   /**
    * Used to reset previously attached callbacks
    * - Note: should be called when views are animating between states, where all interaction should be disabled
    */
   @objc open func clearCallBacks() {
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
      with(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))) {//holdGesture.delegate = self
         $0.cancelsTouchesInView = false
         $0.minimumPressDuration = 0.25
         $0.allowableMovement = 500
         self.addGestureRecognizer($0)
         tap.require(toFail: $0)/*cancels the shortTap from ever firing*/
      }
   }
   /**
    * Long press
    * - Fixme: ⚠️️ Use switch instead of if else here, its more readable
    */
   @objc open func handleLongPress(sender: UILongPressGestureRecognizer) {
      if [.ended, .cancelled, .failed].contains(sender.state) {/*long tap release*/
         handleLongPressRelease()
      } else if case .began = sender.state {/*long tap just began*/
         startingPoint = sender.location(in: sender.view)
         handleLongPressBegan()
      } else if case .changed = sender.state {
         let newPoint = sender.location(in: sender.view)
         let additionalZoom = distance(from: startingPoint, to: newPoint) / 60 - 1
         if additionalZoom >= 0 && additionalZoom <= 6 {
            handleLongPressChanged(addZoom: additionalZoom)
         }
      }
   }
   /**
    * Normal tap
    */
   @objc open func handleTap(sender: UITapGestureRecognizer) {
      if [.ended, .cancelled, .failed].contains(sender.state) {/*short tap release*/
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
      grow()
      onLongPressBegan()
   }
   /**
    * When the user releases a long press of the button
    */
   @objc open func handleLongPressRelease() {
      shrink()
      onLongPressRelease()
   }
   /**
    * When the user moves away from the button while long press
    */
   @objc open func handleLongPressChanged(addZoom: CGFloat) {
      onLongPressChanged(addZoom)
   }
}
/**
 * Private helper extension
 */
extension RecordButton {
   /**
    * Needed to calculate distance from two CGPoints
    */
   fileprivate func distance(from lhs: CGPoint, to rhs: CGPoint) -> CGFloat {
      return (pow(lhs.x - rhs.x, 2) + pow(lhs.y - rhs.y, 2)).squareRoot()
   }
}
