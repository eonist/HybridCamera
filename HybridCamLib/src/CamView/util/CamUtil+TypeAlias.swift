import UIKit
import AVFoundation
/**
 * Callback typealias
 */
extension CamUtil {
   /**
    * - Fixme: ⚠️️ Use Result
    */
   public typealias AssertMicAndVideoAccessComplete = (MicResult) -> Void
   public typealias MicResult = Result<Void, MicAndVideoAccessError>
   public typealias CameraResult = Result<AVCaptureDevice, CaptureDeviceError>
}
