import UIKit

extension CamView {
    /**
     * Called after iamge has been taken and stored in storage
     */
    public typealias PhotoCaptureComplete = (_ image: UIImage?, _ url: URL?, _ error: Error?) -> Void
    /**
     * Called after recording video and has completed processing video and has stored video in storage
     */
    public typealias VideoCaptureComplete = (_ url: URL?, _ error: Error?) -> Void
    /**
     * Default callback for photo capture
     */
    public static let defaultPhotoCaptureComplete: PhotoCaptureComplete = { (_ image: UIImage?, _ url: URL?,_ error: Error?) in
        Swift.print("defaultPhotoCaptureComplete image: \(String(describing: image)) path:\(String(describing: url)) error:\(String(describing: error))")
    }
    /**
     * Default callback for video capture
     */
    public static let defaultVideoCaptureComplete: VideoCaptureComplete = { (_ url: URL?,_ error: Error?) in
        Swift.print("defaultVideoCaptureComplete path:\(String(describing: url)) error:\(String(describing: error))")
    }
}
