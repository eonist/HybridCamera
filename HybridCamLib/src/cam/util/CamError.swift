import Foundation

/**
 * Capture
 * TODO: ⚠️️ Possibly scope to CamView
 */
public enum CaptureError: Swift.Error {
    case noTempFolderAccess
    case malformedImageData
    case noVideoConnection
    case noInputDevice
    case alreadyRecording
    case alreadyStoppedRecording
}
extension CaptureError:CustomStringConvertible{
   public var description: String {
      switch self {
      case .noTempFolderAccess:
         return "couldn't access temp folder on device"
      case .malformedImageData:
         return "Couldn't convert to imageData"
      case .noVideoConnection:
         return "unable to create video connection"
      case .noInputDevice:
         return "unabel to access input device"
      case .alreadyStoppedRecording:
         return "already stopped recording"
      case .alreadyRecording:
         return "already recording"
      }
   }
}
/**
 * Setup
 */
public enum SetupError: Swift.Error {
    case unableToAddPhotoOutput
    case unableToAddVideoOutput
    case unableToGetAudioCaptureDevice
    case unableToGetVideoCaptureDevice
    case unableToCreateVideoConnection
    case unableToActivateBackgroundAudio
}
extension SetupError:CustomStringConvertible {
   public var description: String {
      switch self {
      case .unableToAddPhotoOutput:
         return "unable to add output: capturePhotoOutput"
      case .unableToAddVideoOutput:
         return "unable to add output: captureVideoOutput"
      case .unableToGetAudioCaptureDevice:
         return " could not get audio capture device"
      case .unableToGetVideoCaptureDevice:
         return "could not get video capture device"
      case .unableToCreateVideoConnection:
         return "unable to create video connection"
      case .unableToActivateBackgroundAudio:
         return "unable to set background audio"
      }
   }
}
