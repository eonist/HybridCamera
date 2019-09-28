import Foundation
/**
 * Setup
 */
public enum SetupError: Swift.Error {
   case unableToAddPhotoOutput
   case unableToAddVideoOutput
   case unableToGetAudioCaptureDevice
   case unableToGetVideoCaptureDevice(CamUtil.CaptureDeviceError?)
   case unableToCreateVideoConnection
   case unableToActivateBackgroundAudio
}
/**
 * SetupError+Extension
 */
extension SetupError: CustomStringConvertible {
   public var description: String {
      switch self {
      case .unableToAddPhotoOutput: return "unable to add output: capturePhotoOutput"
      case .unableToAddVideoOutput: return "unable to add output: captureVideoOutput"
      case .unableToGetAudioCaptureDevice: return " could not get audio capture device"
      case .unableToGetVideoCaptureDevice(let error): return "could not get video capture device reason: \(String(describing: error?.localizedDescription))"
      case .unableToCreateVideoConnection: return "unable to create video connection"
      case .unableToActivateBackgroundAudio: return "unable to set background audio"
      }
   }
}
