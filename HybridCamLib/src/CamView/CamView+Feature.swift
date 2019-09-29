import UIKit
import AVFoundation
/**
 * Extra
 */
extension CamView {
   /**
    * Switches between front and back cam
    * - Fixme: ⚠️️ Possibly rename to toggleCameraPosition, possibly use didSet? does that work with @objc overring?
    */
   @objc open func toggleCamera(for cameraPosition: AVCaptureDevice.Position) {
      do {
         self.deviceInput = try CamView.setupCaptureDeviceInput(captureSession, cameraPosition: cameraPosition)
         try CamView.setupMicrophone(captureSession)
      } catch {
         Swift.print("toggleCamera error:  \(error.localizedDescription)")
      }
   }
   /**
    * - Fixme: ⚠️️ possibly use didSet? does that work with @objc overring?
    * - Options: .on, .off, .auto
    */
   @objc open func toggleFlashMode(for flashMode: AVCaptureDevice.FlashMode) { // AVCaptureDevice.FlashMode
      self.flashMode = flashMode
   }
   /**
    * - Fixme: ⚠️️ Could be moved to static method, maybe not since then we need to provide deviceInput as a param, and it already has alot of params
    * - Fixme: ⚠️️ Use Result to gain better error reporting
    * - Reference: https://stackoverflow.com/a/50450425/5389500
    */
   @objc open func focusWithMode(focusMode: AVCaptureDevice.FocusMode, exposureMode: AVCaptureDevice.ExposureMode, point: CGPoint, monitorSubjectAreaChange: Bool) {
      guard let device: AVCaptureDevice = self.deviceInput?.device else { Swift.print("device unavailable 🚫"); return }
      do {
         try device.lockForConfiguration()
         if device.isFocusPointOfInterestSupported && device.isFocusModeSupported(focusMode) {
            device.focusMode = focusMode
            device.focusPointOfInterest = point
         }
         if device.isExposurePointOfInterestSupported && device.isExposureModeSupported(exposureMode) {
            device.exposurePointOfInterest = point
            device.exposureMode = exposureMode
         }
         device.isSubjectAreaChangeMonitoringEnabled = monitorSubjectAreaChange
         device.unlockForConfiguration()
      } catch {
         Swift.print(error)
      }
   }
   /**
    * - Fixme: ⚠️️ Could be moved to static method maybe? maybe not since then we need to provide deviceInput as a param
    * - Fixme: Use Result? or?
    */
   @objc open func setZoomFactor(to factor: CGFloat) {
      guard let device = self.deviceInput?.device else { Swift.print("setZoom() - device not available"); return }
      let maxZoomFactor = device.activeFormat.videoMaxZoomFactor
      do {
         try device.lockForConfiguration()
         defer { device.unlockForConfiguration() }
         device.videoZoomFactor = max(1.0, min(factor, maxZoomFactor))
      } catch {
         print(error)
      }
   }
}
