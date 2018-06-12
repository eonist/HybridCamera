import UIKit
import AVFoundation
/**
 * EXAMPLE:
 * let camView = CamView(frame: UISCreen.bounds)
 * addSubView(camView)
 * camView.startRecording()//start capturing
 * camView.stopRecording()//stop capturing
 */
class CamView:UIView {
    /*UI*/
    lazy var previewView:CamPreviewView = createPreviewView()/*Has the view Finder Preview*/
    /*AV*/
    var deviceInput:AVCaptureDeviceInput?
    let videoOutput = AVCaptureMovieFileOutput()
    let photoOutput:AVCapturePhotoOutput = AVCapturePhotoOutput()
    /*State*/
    var flashMode:AVCaptureDevice.FlashMode = .off
    /*Callbacks*/
    var onVideoCaptureComplete:VideoCaptureComplete = defaultVideoCaptureComplete
    var onPhotoCaptureComplete:PhotoCaptureComplete = defaultPhotoCaptureComplete
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        _ = previewView/*Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.*/
        setupDevice()
        addGestureRecognizer()
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
