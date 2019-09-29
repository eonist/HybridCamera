import UIKit
/**
 * Callback signatures
 */
extension CamView {
   
   // Continue: make this result:
   
   /**
    * Default callback for photo capture
    */
//   public static let defaultPhotoCaptureComplete: PhotoCaptureComplete = { (_ image: UIImage?, _ url: URL?, _ error: Error?) in
//      Swift.print("CamView.defaultPhotoCaptureComplete image: \(String(describing: image)) path:\(String(describing: url)) error:\(String(describing: error))")
//   }
   public static let defaultPhotoCaptureCompleted: PhotoCaptureCompleted = { result in
      guard case .success(let photoAndURL) = result else { Swift.print("result.error:  \(result.errorStr)"); return }
      Swift.print("CamView.defaultPhotoCaptureComplete image: \(String(describing: photoAndURL.0)) path:\(String(describing: photoAndURL.1))")
   }
   
   /**
    * Default callback for video capture
    */
   public static let defaultVideoCaptureComplete: VideoCaptureComplete = { (_ url: URL?, _ error: Error?) in
      Swift.print("CamView.defaultVideoCaptureComplete path:\(String(describing: url)) error:\(String(describing: error))")
   }
}
