import UIKit
import AVFoundation
import With

open class VideoPlayerView:UIView{
   open var avPlayer = AVPlayer()
   public lazy var avPlayerLayer: AVPlayerLayer = createAvPlayerLayer()
   /*Init*/
   override public init(frame: CGRect) {
      super.init(frame: frame)
      _ = avPlayerLayer
      NotificationCenter.default.addObserver(self, selector: #selector(onVideoFinished), name: .AVPlayerItemDidPlayToEndTime, object: nil)
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Extension
 */
extension VideoPlayerView {
   /**
    * Creates the video player layer
    */
   @objc open func createAvPlayerLayer() -> AVPlayerLayer {
      return with(AVPlayerLayer(player: avPlayer)) {
         $0.frame = frame
         $0.videoGravity = .resizeAspectFill
         self.layer.insertSublayer($0, at: 0)
      }
   }
   /**
    * Play video
    */
   @objc open func play(videoURL: URL) {
      with(AVPlayerItem(url: videoURL as URL)) {
         avPlayer.replaceCurrentItem(with: $0)
         avPlayer.play()
      }
   }
   /**
    * Callback when video finish playing
    */
   @objc open func onVideoFinished() {
      avPlayer.seek(to: CMTime.zero)/*Go to the absolute begining*/
      avPlayer.play()
   }
   /**
    * Setting object to nil makes the observer work on the
    */
   @objc open func deInitiate() {
      NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
   }
}
