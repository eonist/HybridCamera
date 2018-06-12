import UIKit
/**
 * Gesture recognizer for StoryVCView
 */
extension RecordButton:UIGestureRecognizerDelegate{
    typealias ShortPressReleased = ()->Void
    typealias LongPressBegan = ()->Void
    typealias LongPressReleased = ()->Void
    static let defaultShortPressReleased:ShortPressReleased  = { Swift.print("RecordButton.onShortPressRelease - no call back attached")}
    static let defaultLongPressBegan:LongPressBegan = { Swift.print("RecordButton.onLongPressBegan - no call back attached")}
    static let defaultLongPressReleased:LongPressReleased = { Swift.print("RecordButton.onLongPressRelease - no call back attached")}
    /**
     * Used to reset callbacks
     * NOTE: should be called when views are animating between states, where all interaction should be disabled
     */
    func removeCallBacks(){
        Swift.print("RecordButton.removeCallBacks()")
        onShortPressRelease = RecordButton.defaultShortPressReleased
        onLongPressBegan = RecordButton.defaultLongPressBegan
        onLongPressRelease = RecordButton.defaultLongPressReleased
    }
    /**
     * Adds gesture listeners to button
     */
    func addGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        self.addGestureRecognizer(tap)
        _ = {
            let holdGesture =  UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))//holdGesture.delegate = self
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
    @objc func handleLongPress(sender : UITapGestureRecognizer){
        //        Swift.print("handleLongPress")
        if [.ended,.cancelled,.failed].contains(sender.state)  {//long tap release
            handleLongPressRelease()
        }else if case .began = sender.state{//long tap just began
            handleLongPressBegan()
        }
    }
    /**
     * Normal tap
     */
    @objc func handleTap(sender : UITapGestureRecognizer) {
        Swift.print("handleTap")
        if [.ended,.cancelled,.failed].contains(sender.state)  {//short tap release
            handleShorPressRelease()
        }
    }
    /**
     * When the user short presses the button
     */
    func handleShorPressRelease(){
        onShortPressRelease()
    }
    /**
     * Note: this method is justified because its called from multiple places in this class etc
     */
    func handleLongPressBegan(){
        grow()
        onLongPressBegan()
    }
    /**
     * When the user releases a long press of the button
     */
    func handleLongPressRelease(){
        shrink()
        onLongPressRelease()
    }
}

