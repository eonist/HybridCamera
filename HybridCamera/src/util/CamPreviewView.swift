import UIKit
import AVFoundation

//figure out how to get callbacks and remove the glitch in the begining of the recording ✅

class CamPreviewView:UIView{
    lazy var previewLayer:AVCaptureVideoPreviewLayer = createPreviewLayer()
    lazy var captureSession:AVCaptureSession = createCaptureSession()
    override init(frame: CGRect) {
        super.init(frame:frame)
        _ = captureSession
        _ = previewLayer
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
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
    func createPreviewLayer() -> AVCaptureVideoPreviewLayer{
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = self.layer.bounds
        self.layer.insertSublayer(previewLayer, at: 0)
        return previewLayer
    }
    /**
     * Initialize the captureSession object
     */
    func createCaptureSession() -> AVCaptureSession{
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .high
        return captureSession
    }
}
