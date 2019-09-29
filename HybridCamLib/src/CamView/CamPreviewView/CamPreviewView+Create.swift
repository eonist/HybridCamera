import UIKit
import AVFoundation
import With
/**
 * Create
 */
extension CamPreviewView {
   /**
    * Shows the camera view finder
    */
   @objc open func createPreviewLayer() -> AVCaptureVideoPreviewLayer {
      return with(.init(session: captureSession)) {
         $0.videoGravity = .resizeAspectFill
         $0.frame = self.layer.bounds
         self.layer.insertSublayer($0, at: 0)
      }
   }
   /**
    * Initialize the captureSession object
    */
   @objc open func createCaptureSession() -> AVCaptureSession {
      return with(.init()) {
         $0.sessionPreset = .high
      }
   }
}
