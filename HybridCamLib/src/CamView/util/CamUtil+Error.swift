import Foundation
import AVFoundation
/**
 * Errors
 */
extension CamUtil {
   public enum MicAndVideoAccessError: Error {
      case micAuthorized, micDeniedOrRestricted, micAccessNotDetermined, videoAccessWasDenied
   }
   public enum CaptureDeviceError: Error {
      case noCameraOfTypeAvailable(AVCaptureDevice.DeviceType, [AVCaptureDevice])
      case noPositionAvailableForDeviceType(AVCaptureDevice.Position, AVCaptureDevice.DeviceType) // Fixme: add support for , availableDeviceTypes: later
   }
}
