import UIKit
/**
 * Call-back types
 */
extension CamView {
   /**
    * Called after image has been taken and stored in storage
    */
   public typealias PhotoCaptureComplete = (_ image: UIImage?, _ url: URL?, _ error: Error?) -> Void
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
