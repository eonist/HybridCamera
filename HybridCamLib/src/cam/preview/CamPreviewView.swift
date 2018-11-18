import UIKit
import AVFoundation

open class CamPreviewView:UIView{
   /*Camera view finder*/
   public lazy var previewLayer:AVCaptureVideoPreviewLayer = createPreviewLayer()
   /*Capture session*/
   public lazy var captureSession:AVCaptureSession = createCaptureSession()
   override public init(frame: CGRect) {
      super.init(frame:frame)
      _ = captureSession
      _ = previewLayer
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension CamPreviewView{
   /**
    * Shows the camera view finder
    */
   @objc open func createPreviewLayer() -> AVCaptureVideoPreviewLayer{
      let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
      previewLayer.videoGravity = .resizeAspectFill
      previewLayer.frame = self.layer.bounds
      self.layer.insertSublayer(previewLayer, at: 0)
      return previewLayer
   }
   /**
    * Initialize the captureSession object
    */
   @objc open func createCaptureSession() -> AVCaptureSession{
      let captureSession = AVCaptureSession()
      captureSession.sessionPreset = .high
      return captureSession
   }
}
