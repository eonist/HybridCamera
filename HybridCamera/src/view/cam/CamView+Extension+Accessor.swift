import UIKit
import AVFoundation

/**
 * Accessor
 */
extension CamView{
    /**
     * Temp
     */
    var captureSession:AVCaptureSession { return previewView.captureSession }
    /**
     * New
     */
    static var currentVideoOrientation:AVCaptureVideoOrientation {
//        let  orientation:AVCaptureVideoOrientation = {
//            switch UIDevice.current.orientation {
//            case .portrait:
//                return .portrait
//            case .landscapeRight:
//                return .landscapeLeft
//            case .portraitUpsideDown:
//                return .portraitUpsideDown
//            default:
//                return .landscapeRight
//            }
//        }()
//        _ = orientation
        return .portrait
    }
    
}
