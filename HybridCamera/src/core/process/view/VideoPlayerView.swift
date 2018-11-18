import UIKit
import AVFoundation

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
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Extension
 */
extension VideoPlayerView{
   /**
    * Creates the video player layer
    */
   @objc open func createAvPlayerLayer() -> AVPlayerLayer{
      let avPlayerLayer = AVPlayerLayer(player: avPlayer)
      avPlayerLayer.frame = frame
      avPlayerLayer.videoGravity = .resizeAspectFill
      self.layer.insertSublayer(avPlayerLayer, at: 0)
      return avPlayerLayer
   }
   /**
    * Play video
    */
   @objc open func play(videoURL:URL){
      let playerItem = AVPlayerItem(url: videoURL as URL)
      avPlayer.replaceCurrentItem(with: playerItem)
      avPlayer.play()
   }
   /**
    * Callback when video finish playing
    */
   @objc open func onVideoFinished(){
      avPlayer.seek(to: kCMTimeZero)/*Go to the absolute begining*/
      avPlayer.play()
   }
   /**
    * Setting object to nil makes the observer work on the
    */
   @objc open func deInitiate(){
      NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
   }
}
