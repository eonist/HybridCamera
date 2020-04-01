import UIKit
import ResultSugar
/**
 * Callback signatures
 */
extension CamView {
   /**
    * Default callback for photo capture
    */
   public static let defaultPhotoCaptureCompleted: PhotoCaptureCompleted = {
      let imageAndURL: (image: UIImage, url: URL)? = $0.value()
      Swift.print("CamView.defaultPhotoCaptureComplete image: \(String(describing: imageAndURL?.image)) path:\(String(describing: imageAndURL?.url))  error: \($0.errorStr)")
   }
   /**
    * Default callback for video capture
    */
   public static let defaultVideoCaptureCompleted: VideoCaptureCompleted = {
      let url: URL? = $0.value()
      Swift.print("CamView.defaultVideoCaptureComplete path:\(String(describing: url)) error: \($0.errorStr)")
   }
}
