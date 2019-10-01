import UIKit
import AVFoundation
import With
/**
 * Action
 */
extension ProcessView {
   /**
    * Presents either image or video (Video only has URL, so we diffrerentiate on that)
    */
   @objc open func present(image: UIImage?, url: URL) {
      if let image = image {
         imageView.setImageAndURL(url: url, image: image)
      } else {
         videoPlayerView.play(videoURL: url)
      }
   }
}
