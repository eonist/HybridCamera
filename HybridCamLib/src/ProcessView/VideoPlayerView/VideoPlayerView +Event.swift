import Foundation
/**
 * Extension
 */
extension VideoPlayerView {
   /**
    * Callback when video finish playing
    */
   @objc open func onVideoFinished() {
      avPlayer?.seek(to: .zero) // Go to the absolute begining
      avPlayer?.play()
   }
}
