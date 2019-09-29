import UIKit
import AVFoundation
/**
 * Extra
 */
extension CamView {
   /**
    * Switches between front and back cam
    * - Fixme: ⚠️️ possibly use didSet? does that work with @objc overring?
    * - Throws: SetupError
    */
   @objc open func toggleCameraPosition(for cameraPosition: AVCaptureDevice.Position) throws {
      self.deviceInput = try captureSession.setupCaptureDeviceInput(cameraPosition: cameraPosition)
      try captureSession.setupMicrophone()
   }
}
