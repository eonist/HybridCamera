import UIKit
import AVFoundation
import With

/**
 * Event
 */
extension ProcessView {
   /**
    * AttachCallBacks
    * - Fixme: ⚠️️ move these closures into const var
    */
   @objc open func addEventListeners() {
      exitButton.onClick = { [weak self] in
         self?.onExit() // Warning: ⚠️️ this needs to be called like it is, not simply assigned
      }
      shareButton.onClick = { [weak self] in // launch share AlertDialog
         guard let self = self else { Swift.print("🚫"); return }
         if let imageURL = self.imageView.url {
            self.onShare( imageURL )
         } else if let videoURL = (self.videoPlayerView.avPlayer?.currentItem?.asset as? AVURLAsset)?.url {
            self.onShare(videoURL)
         } else {
            self.onShare(nil)
         }
      }
   }
}
