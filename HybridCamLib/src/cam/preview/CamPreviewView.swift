import UIKit
import AVFoundation
import With

open class CamPreviewView: UIView {
   public lazy var previewLayer: AVCaptureVideoPreviewLayer = createPreviewLayer()/* Camera view finder */
   public lazy var captureSession: AVCaptureSession = createCaptureSession()/* Capture session */
   override public init(frame: CGRect) {
      super.init(frame: frame)
      _ = captureSession
      _ = previewLayer
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
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
