import UIKit
import AVFoundation

/**
 * Getters
 */
extension CamView {
    /**
     * Accessor to get captureSession
     */
    public var captureSession: AVCaptureSession { return previewView.captureSession }
    /**
     * - NOTE: ⚠️️ for now HybridCamerea only supports .portrait
     */
    static var currentVideoOrientation: AVCaptureVideoOrientation {
        return .portrait
    }
}
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
