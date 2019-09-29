import UIKit
import AVFoundation
import With
/**
 * VideoCamera actions
 */
extension CamView {
   /**
    * Starts recording video
    */
   
   // add Result here
   
   @objc open func startRecording() {
      guard let device: AVCaptureDevice = deviceInput?.device else { onVideoCaptureComplete(nil, CaptureError.noInputDevice); return }
      if device.isSmoothAutoFocusSupported {
         do {
            try device.lockForConfiguration()
            device.isSmoothAutoFocusEnabled = false
            device.unlockForConfiguration()
         } catch {
            onVideoCaptureComplete(nil, error)
         }
      }
      guard videoOutput.isRecording == false else { onVideoCaptureComplete(nil, CaptureError.alreadyRecording); return }
      guard let connection: AVCaptureConnection = videoOutput.connection(with: .video) else { onVideoCaptureComplete(nil, CaptureError.noVideoConnection); return }
      if connection.isVideoOrientationSupported {
         connection.videoOrientation = CamView.currentVideoOrientation
      }
      connection.isVideoMirrored = connection.isVideoMirroringSupported && device.position == .front
      guard let outputURL: URL = FileUtil.tempURL() else { onVideoCaptureComplete(nil, CaptureError.noTempFolderAccess); return }
      videoOutput.startRecording(to: outputURL, recordingDelegate: self)
   }
   /**
    * Stops recording video
    */
   
    // add Result here
   
   
   @objc open func stopRecording() {
      guard videoOutput.isRecording else { onVideoCaptureComplete(nil, CaptureError.alreadyStoppedRecording); return }
      videoOutput.stopRecording()
   }
}
