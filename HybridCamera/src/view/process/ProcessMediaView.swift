import UIKit
import AVFoundation

open class ProcessMediaView:UIView{
    /*UI*/
    lazy var imageView:ImageView = createImageView()
    lazy var videoPlayerView:VideoPlayerView = createVideoView()
    lazy var exitButton:ExitButton = createExitButton()
    lazy var shareButton:ShareButton = createShareButton()
    /*CallBacks*/
    var onShare:OnShare = ProcessMediaView.defaultOnShare
    var onExit:OnExit = ProcessMediaView.defaultOnExit
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .black
        _ = imageView
        _ = videoPlayerView
        _ = exitButton
        _ = shareButton
        attachCallBacks()
    }
    /**
     * Boilerplate
     */
   required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * deInitiate
     */
    open func deInitiate(){
        videoPlayerView.deInitiate()/*Removes observer*/
        self.removeFromSuperview()/*Removes it self from the view hierarchy*/
    }
}
/**
 * Callback signatures
 */
extension ProcessMediaView {
   typealias OnShare = (_ url:URL?) -> Void
   typealias OnExit = () -> Void
   static let defaultOnShare:OnShare = { _ in Swift.print("default onShare")}
   static let defaultOnExit = { Swift.print("default onExit") }
}
