import UIKit
import AVFoundation

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
