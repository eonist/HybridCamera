import UIKit
/**
 * Callback signatures
 */
extension CamView {
   /**
    * Default callback for photo capture
    */
   public static let defaultPhotoCaptureComplete: PhotoCaptureComplete = { (_ image: UIImage?, _ url: URL?, _ error: Error?) in
      Swift.print("CamView.defaultPhotoCaptureComplete image: \(String(describing: image)) path:\(String(describing: url)) error:\(String(describing: error))")
   }
   /**
    * Default callback for video capture
    */
   public static let defaultVideoCaptureComplete: VideoCaptureComplete = { (_ url: URL?, _ error: Error?) in
      Swift.print("CamView.defaultVideoCaptureComplete path:\(String(describing: url)) error:\(String(describing: error))")
   }
}
