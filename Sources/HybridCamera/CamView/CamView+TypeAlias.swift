import UIKit
/**
 * Call-back types
 */
extension CamView {
   /**
    * Called after image has been taken and stored in storage
    */
   public typealias PhotoCaptureCompleted = (Result<(image: UIImage, url: URL), CaptureError>) -> Void //(_ image: UIImage?, _ url: URL?, _ error: Error?) -> Void
   /**
    * Called after recording video and has completed processing video and has stored video in storage
    */
   public typealias VideoCaptureCompleted = (Result<URL, CaptureError>) -> Void
   /**
    * Video or Image
    */
   public typealias MediaCaptureComplete = (MediaCapture) -> Void
}
/**
 * Result type
 */
extension CamView {
   public typealias SetupCaptureDeviceInputResult = Result<Void, SetupError>
   public typealias MediaCapture = Result<(image: UIImage?, url: URL), CaptureError>
}
