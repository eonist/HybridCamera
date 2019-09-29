import UIKit
import AVFoundation
/**
 * Helper methods for setting up
 */
extension AVCaptureDeviceInput {
   /**
    * Set zoom factor
    */
   @objc open func setZoomFactor(to factor: CGFloat) throws {
      let maxZoomFactor = self.device.activeFormat.videoMaxZoomFactor
      do {
         try self.device.lockForConfiguration()
         defer { self.device.unlockForConfiguration() }
         self.device.videoZoomFactor = max(1.0, min(factor, maxZoomFactor))
      } catch {
         throw error
      }
   }
   /**
    * - Fixme: ⚠️️ Could be moved to static method, maybe not since then we need to provide deviceInput as a param, and it already has alot of params
    * - Reference: https://stackoverflow.com/a/50450425/5389500
    * - Throws: an NSError describing why the failure occurred
    */
   @objc open func focusWithMode(focusMode: AVCaptureDevice.FocusMode, exposureMode: AVCaptureDevice.ExposureMode, point: CGPoint, monitorSubjectAreaChange: Bool) throws {
      try self.device.lockForConfiguration()
      if self.device.isFocusPointOfInterestSupported && self.device.isFocusModeSupported(focusMode) {
         self.device.focusMode = focusMode
         self.device.focusPointOfInterest = point
      }
      if self.device.isExposurePointOfInterestSupported && self.device.isExposureModeSupported(exposureMode) {
         self.device.exposurePointOfInterest = point
         self.device.exposureMode = exposureMode
      }
      self.device.isSubjectAreaChangeMonitoringEnabled = monitorSubjectAreaChange
      self.device.unlockForConfiguration()
   }
}
