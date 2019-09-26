import Foundation
/**
 * Capture
 * Fixme: ⚠️️ Possibly scope to CamView
 * Fixme: nest the error messages into similar groups etc
 */
public enum CaptureError: Swift.Error {
   case noTempFolderAccess
   case malformedImageData
   case noVideoConnection
   case noInputDevice
   case alreadyRecording
   case alreadyStoppedRecording
}
extension CaptureError: CustomStringConvertible {
   public var description: String {
      switch self {
      case .noTempFolderAccess: return "couldn't access temp folder on device"
      case .malformedImageData: return "Couldn't convert to imageData"
      case .noVideoConnection: return "unable to create video connection"
      case .noInputDevice: return "unabel to access input device"
      case .alreadyStoppedRecording: return "already stopped recording"
      case .alreadyRecording: return "already recording"
      }
   }
}
