import Foundation
/**
 * Capture
 * Fixme: ⚠️️ nest the error messages into similar groups maybe? one for photo one for video?
 */
public enum CaptureError: Swift.Error {
   case noTempFolderAccess
   case unableToCreateTempFilePath
   case filePathAlreadyExists
   case failedToWriteFile(Error)
   case malformedImageData
   case noVideoConnection
   case noInputDevice
   case unableToLockForConfiguration
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
      case .unableToLockForConfiguration: return "unable To Lock For Configuration"
      case .alreadyStoppedRecording: return "Already stopped recording"
      case .alreadyRecording: return "Already recording"
      }
   }
}
