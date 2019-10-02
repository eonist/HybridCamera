import UIKit
import AVFoundation
/**
 * Extra
 */
extension CamView {
   /**
    * Switches between front and back cam
    * - Throws: SetupError
    */
   @objc open func toggleCameraPosition(for cameraPosition: AVCaptureDevice.Position, deviceType: AVCaptureDevice.DeviceType = .builtInWideAngleCamera) throws {
      self.deviceInput = try captureSession.setupCaptureDeviceInput(cameraPosition: cameraPosition)
      try captureSession.setupMicrophone()
   }
   /**
    * Adds ability to zoom from the recordbutton by swiping up/down while recording
    * - Fixme: ⚠️️ After going back to camView after seeing recorded video, reset zoom: setZoom(zoomFactor: 1) needs to be called and startingZoomFactorForLongPress = 1
    * - Note: Can be used in conjunction with: $0.onLongPressChanged = { addZoom in self.camView.zoomViaRecord(addZoom: addZoom) }
    */
   @objc open func zoomViaRecord(addZoom: CGFloat) {
      try? deviceInput?.setZoomFactor(to: startingZoomFactorForLongPress + addZoom)
   }
}
