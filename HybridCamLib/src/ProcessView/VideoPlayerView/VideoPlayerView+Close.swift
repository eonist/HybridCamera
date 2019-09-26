import Foundation
/**
 * Close / deInitiate
 */
extension VideoPlayerView {
   /**
    * Setting object to nil makes the observer work on the
    */
   @objc open func deInitiate() {
      NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil) // we remove the listener for the video finish callback
      avPlayer = nil
      avPlayerLayer.removeFromSuperlayer()
   }
}
