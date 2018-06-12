import UIKit

class RecordButton:UIView{
    /*Interaction Callbacks*/
    var onShortPressRelease:ShortPressReleased = RecordButton.defaultShortPressReleased
    var onLongPressBegan:LongPressBegan = RecordButton.defaultLongPressBegan
    var onLongPressRelease:LongPressReleased = RecordButton.defaultLongPressReleased
    /*UI*/
    lazy var circle:Circle = createCircle()
    override init(frame: CGRect) {
        super.init(frame: RecordButton.rect)
        _ = circle
        addGestureRecognizer()
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
