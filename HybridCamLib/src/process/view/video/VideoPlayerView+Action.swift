import UIKit
import AVFoundation
import With

extension VideoPlayerView {
   /**
    * Play video
    */
   @objc open func play(videoURL: URL) {
      with(AVPlayerItem(url: videoURL as URL)) {
         avPlayer?.replaceCurrentItem(with: $0)
         avPlayer?.play()
      }
   }
}
