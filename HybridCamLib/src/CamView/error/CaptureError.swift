import Foundation
/**
 * Capture
 * Fixme: ⚠️️ Possibly scope to CamView
 * Fixme: nest the error messages into similar groups maybe?
 */
public enum CaptureError: Swift.Error {
   case noTempFolderAccess
   case malformedImageData
   case unableToCreateTempFilePath
   case filePathAlreadyExists
   case failedToWriteFile(Error)
   case noVideoConnection
   case noInputDevice
   case alreadyRecording
   case alreadyStoppedRecording
}
extension CaptureError: CustomStringConvertible {
   public var localizedDescription: String { return description }
   public var description: String { // remove this
      switch self {
      case .noTempFolderAccess: return "Couldn't access temp folder on device"
      case .malformedImageData: return "Couldn't convert to imageData"
      case .unableToCreateTempFilePath: return "unable To Create Temp FilePath"
      case .failedToWriteFile(let error): return "failed to write file – bad permissions, bad filename, missing permissions, or something else error: \(error.localizedDescription)"
      case .filePathAlreadyExists: return "File path already exists"
      case .noVideoConnection: return "Unable to create video connection"
      case .noInputDevice: return "Unabel to access input device"
      case .alreadyStoppedRecording: return "Already stopped recording"
      case .alreadyRecording: return "Already recording"
      }
   }
}
