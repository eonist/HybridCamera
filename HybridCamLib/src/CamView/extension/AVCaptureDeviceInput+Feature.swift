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
      try self.device.lockForConfiguration()
      defer { self.device.unlockForConfiguration() }
      self.device.videoZoomFactor = max(1.0, min(factor, maxZoomFactor))
   }
}
