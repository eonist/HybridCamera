import UIKit
import AVFoundation
import With

/**
 * Event
 */
extension ProcessView {
   /**
    * AttachCallBacks
    */
   @objc open func addEventListeners() {
      exitButton.onClick = { [weak self] in
         self?.onExit()
      } // Warning: ⚠️️ this needs to be called like it is, not simply assigned
      shareButton.onClick = { [weak self] in /*launch share AlertDialog*/
         if let imageURL = self?.imageView.url {
            self?.onShare( imageURL )
         } else if let videoURL = (self?.videoPlayerView.avPlayer?.currentItem?.asset as? AVURLAsset)?.url {
            self?.onShare(videoURL)
         } else {
            self?.onShare(nil)
         }
      }
   }
}
