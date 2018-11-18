import UIKit
import AVFoundation

open class ProcessMediaView:UIView{
   /*UI*/
   public lazy var imageView:ImageView = createImageView()
   public lazy var videoPlayerView:VideoPlayerView = createVideoView()
   public lazy var exitButton:ExitButton = createExitButton()
   public lazy var shareButton:ShareButton = createShareButton()
   /*CallBacks*/
   public var onShare:OnShare = ProcessMediaView.defaultOnShare
   public var onExit:OnExit = ProcessMediaView.defaultOnExit
   override init(frame:CGRect) {
      super.init(frame:frame)
      self.backgroundColor = .black
      _ = imageView
      _ = videoPlayerView
      _ = exitButton
      _ = shareButton
      addEventListeners()
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
