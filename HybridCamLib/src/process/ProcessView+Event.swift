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
      exitButton.onClick = { self.onExit() } // Warning: ⚠️️ this needs to be called like it is, not simply assigned
      shareButton.onClick = {/*launch share AlertDialog*/
         if let imageURL = self.imageView.url {
            self.onShare( imageURL )
         } else if let videoURL = (self.videoPlayerView.avPlayer.currentItem?.asset as? AVURLAsset)?.url {
            self.onShare(videoURL)
         } else {
            self.onShare(nil)
         }
      }
   }
   /**
    * Reset callbacks
    */
   //   @objc open func clearEventListeners(){
   //      exitButton.onClick = {ClickButtonKind.defaultOnClick}
   //      shareButton.onClick = {ClickButtonKind.defaultOnClick}
   //   }
}
