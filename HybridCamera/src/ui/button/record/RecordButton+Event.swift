import UIKit
import With
/**
 * Gesture recognizer
 */
extension RecordButton:UIGestureRecognizerDelegate{
    /**
     * Used to reset previously attached callbacks
     * - Note: should be called when views are animating between states, where all interaction should be disabled
     */
    @objc open func clearCallBacks(){
        onShortPressRelease = RecordButton.defaultShortPressReleased
        onLongPressBegan = RecordButton.defaultLongPressBegan
        onLongPressRelease = RecordButton.defaultLongPressReleased
    }
    /**
     * Adds gesture listeners to button
     */
    @objc open func addGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action:#selector(handleTap))
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
     */
    @objc open func handleLongPress(sender : UITapGestureRecognizer){
        if [.ended,.cancelled,.failed].contains(sender.state)  {/*long tap release*/
            handleLongPressRelease()
        }else if case .began = sender.state{/*long tap just began*/
            handleLongPressBegan()
        }
    }
    /**
     * Normal tap
     */
    @objc open func handleTap(sender : UITapGestureRecognizer) {
        if [.ended,.cancelled,.failed].contains(sender.state) {/*short tap release*/
            handleShorPressRelease()
        }
    }
   /**
    * When the user short presses the button
    */
   @objc open func handleShorPressRelease(){
      onShortPressRelease()
   }
   /**
    * Note: this method is justified because its called from multiple places in this class etc
    */
   @objc open func handleLongPressBegan(){
      grow()
      onLongPressBegan()
   }
   /**
    * When the user releases a long press of the button
    */
   @objc open func handleLongPressRelease(){
      shrink()
      onLongPressRelease()
   }
}
