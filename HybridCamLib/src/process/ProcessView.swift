import UIKit
import AVFoundation

open class ProcessView: UIView {
   /*UI*/
   public lazy var imageView: ImageView = createImageView()
   public lazy var videoPlayerView: VideoPlayerView = createVideoView()
   public lazy var exitButton: ClickButtonKind = createExitButton()
   public lazy var shareButton: ClickButtonKind = createShareButton()
   /*CallBacks*/
   public var onShare: OnShare = ProcessView.defaultOnShare
   public var onExit: OnExit = ProcessView.defaultOnExit
   override public init(frame: CGRect) {
      super.init(frame: frame)
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
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
