import UIKit
/**
 * Call-back types
 */
extension CamView {
   /**
    * Called after image has been taken and stored in storage
    * - Fixme: the url might not need to be optional
    */
   public typealias PhotoCaptureCompleted = (Result<(UIImage, URL), CaptureError>)  -> Void //(_ image: UIImage?, _ url: URL?, _ error: Error?) -> Void
//   public typealias PhotoCaptureComplete = (_ image: UIImage?, _ url: URL?, _ error: Error?) -> Void
   /**
    * Called after recording video and has completed processing video and has stored video in storage
    */
   public typealias VideoCaptureComplete = (_ url: URL?, _ error: Error?) -> Void
}
/**
 * Result type
 */
extension CamView {
   public typealias SetupCaptureDeviceInputResult = Result<Void, SetupError>
}
