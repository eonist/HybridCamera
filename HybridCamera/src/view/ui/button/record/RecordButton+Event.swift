import UIKit
/**
 * Gesture recognizer for StoryVCView
 */
extension RecordButton:UIGestureRecognizerDelegate{
    /**
     * Used to reset callbacks
     * NOTE: should be called when views are animating between states, where all interaction should be disabled
     */
    @objc open func removeCallBacks(){
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
        _ = {
            let holdGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))//holdGesture.delegate = self
            holdGesture.cancelsTouchesInView = false
            holdGesture.minimumPressDuration = 0.25
            holdGesture.allowableMovement = 500
            self.addGestureRecognizer(holdGesture)
            tap.require(toFail: holdGesture)/*cancels the shortTap from ever firing*/
        }()
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
/**
 * Callback signatures
 */
extension RecordButton {
   public typealias ShortPressReleased = () -> Void
   public typealias LongPressBegan = () -> Void
   public typealias LongPressReleased = () -> Void
   public static let defaultShortPressReleased:ShortPressReleased  = { Swift.print("RecordButton.onShortPressRelease - no call back attached")}
   public static let defaultLongPressBegan:LongPressBegan = { Swift.print("RecordButton.onLongPressBegan - no call back attached")}
   public static let defaultLongPressReleased:LongPressReleased = { Swift.print("RecordButton.onLongPressRelease - no call back attached")}
}
