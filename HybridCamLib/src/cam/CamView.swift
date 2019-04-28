import UIKit
import AVFoundation
/**
 * ## Examples:
 * let camView = CamView(frame: UISCreen.bounds)
 * addSubView(camView)
 * camView.startRecording()//start capturing
 * camView.stopRecording()//stop capturing
 */
open class CamView: UIView {
   /*UI*/
   public lazy var previewView: CamPreviewView = createPreviewView()/*Has the view Finder Preview*/
   /*AV*/
   public var deviceInput: AVCaptureDeviceInput?
   public let videoOutput = AVCaptureMovieFileOutput()
   public let photoOutput: AVCapturePhotoOutput = .init()
   /*State*/
   public var flashMode: AVCaptureDevice.FlashMode = .off
   /*Callbacks*/
   public var onVideoCaptureComplete: VideoCaptureComplete = defaultVideoCaptureComplete
   public var onPhotoCaptureComplete: PhotoCaptureComplete = defaultPhotoCaptureComplete
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .black
      _ = previewView/*Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer*/
      setupDevice()
      addGestureRecognizer()
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
