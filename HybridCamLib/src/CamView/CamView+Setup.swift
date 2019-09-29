import UIKit
import AVFoundation
/**
 * Setup
 */
extension CamView {
   /**
    * - Note: Setting device.focusMode = .continuousAutoFocus, device.exposureMode = .continuousAutoExposure could make the app better
    * - Throws: SetupError, can be used in init to forward meaningfull error message to user
    */
   @objc open func setupDevice() throws {
      self.deviceInput = try captureSession.setupCaptureDeviceInput(cameraPosition: .back)
      try captureSession.setupVideoCamera(output: videoOutput)
      try captureSession.setupMicrophone()
      try captureSession.setupPhotoCamera(output: photoOutput)
      try captureSession.setupBackgroundAudioSupport(category: .playAndRecord)
   }
}
