import UIKit
import AVFoundation

class ProcessMediaView:UIView{
    /*UI*/
    lazy var imageView:ImageView = createImageView()
    lazy var videoPlayerView:VideoPlayerView = createVideoView()
    lazy var exitButton:ExitButton = createExitButton()
    lazy var shareButton:ShareButton = createShareButton()
    /*CallBacks*/
    var onShare:(_ url:URL?) -> Void = { _ in Swift.print("default onShare")}
    var onExit:()->Void = {Swift.print("default onExit")}
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
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * deInitiate
     */
    func deInitiate(){
        videoPlayerView.deInitiate()
        self.removeFromSuperview()
    }
}


