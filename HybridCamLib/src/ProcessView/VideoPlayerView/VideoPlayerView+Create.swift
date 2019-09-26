import UIKit
import AVFoundation
import With
/**
 * Create
 */
extension VideoPlayerView {
   /**
    * Creates the video player layer
    */
   @objc open func createAvPlayerLayer() -> AVPlayerLayer {
      return with(.init(player: avPlayer)) {
         $0.frame = frame
         $0.videoGravity = .resizeAspectFill
         self.layer.insertSublayer($0, at: 0)
      }
   }
}
