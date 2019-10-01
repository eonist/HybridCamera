import Foundation
/**
 * Setup
 * - Fixme: ⚠️️ Maybe nest these errors?
 */
public enum SetupError: Swift.Error {
   case unableToAddPhotoOutput
   case unableToAddVideoOutput
   case unableToGetAudioCaptureDevice
   case unableToGetAudioCaptureDeviceInput(Error)
   case unableToGetVideoCaptureDevice(CamUtil.CaptureDeviceError?)
   case unableToGetVideoCaptureDeviceInput(Error)
   case unableToAddDeviceInputToReceiver
   case unableToCreateVideoConnection
   case unableToActivateBackgroundAudio(Error)
}
/**
 * SetupError+Extension
 */
extension SetupError: CustomStringConvertible {
   public var localizedDescription: String {
      return description
   }
   public var description: String { //  needed to fulfill CustomStringConvertible
      switch self {
      case .unableToAddPhotoOutput: return "unable to add output: capturePhotoOutput"
      case .unableToAddVideoOutput: return "unable to add output: captureVideoOutput"
      case .unableToGetAudioCaptureDevice: return " could not get audio capture device"
      case .unableToGetAudioCaptureDeviceInput(let error): return " could not get audio capture device input. Reason: \(error.localizedDescription)"
      case .unableToGetVideoCaptureDevice(let error): return "could not get video capture device reason: \(String(describing: error?.localizedDescription))"
      case .unableToGetVideoCaptureDeviceInput(let error): return "could not get video capture device input reason: \(String(describing: error.localizedDescription))"
      case .unableToAddDeviceInputToReceiver: return "the proposed input can not be added to the receiver"
      case .unableToCreateVideoConnection: return "unable to create video connection"
      case .unableToActivateBackgroundAudio(let error): return "unable to set background audio. cause:\(error.localizedDescription)"
      }
   }
}
