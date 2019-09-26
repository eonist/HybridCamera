import UIKit
import AVFoundation
import With
/**
 * This view is used to show a looping video
 * - Fixme: ⚠️️ Maybe rename to VideoReviewView?
 */
open class VideoPlayerView: UIView {
   open var avPlayer: AVPlayer? = .init()
   public lazy var avPlayerLayer: AVPlayerLayer = createAvPlayerLayer()
   // Init
   override public init(frame: CGRect) {
      super.init(frame: frame)
      _ = avPlayerLayer
      NotificationCenter.default.addObserver(self, selector: #selector(onVideoFinished), name: .AVPlayerItemDidPlayToEndTime, object: nil) // This is used as a callback to notify when the video is finished playing, we remove this listner in the deInitiate method
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
