import UIKit
import AVFoundation
/**
 * VideoCamera Delegate
 */
extension CamView: AVCaptureFileOutputRecordingDelegate {
   /**
    * This is called when the video recording starts ( Informs the delegate when the output has started writing to a file.)
    */
   @objc open func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
      /* FixMe: ⚠️️ for some reason this isn't called*/
   }
   /**
    * This is called when the video has finished recording. (Called whenever the output is recording to a file and successfully pauses the recording at the request of the client.)
    * - Note: When the video has stopped recording, you get an output file URL
    */
   @objc open func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
      onVideoCaptureComplete(.success(outputFileURL))
   }
}
