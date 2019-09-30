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
   @objc open func startRecordingVideo() {
      guard let device: AVCaptureDevice = deviceInput?.device else { onVideoCaptureComplete(.failure(.noInputDevice)); return }
      if device.isSmoothAutoFocusSupported {
         do {
            try device.lockForConfiguration() // Fixme: ⚠️️ explain what this code block does
            device.isSmoothAutoFocusEnabled = false
            device.unlockForConfiguration()
         } catch {
            onVideoCaptureComplete(.failure(.unableToLockForConfiguration))
         }
      }
      guard !videoOutput.isRecording else { onVideoCaptureComplete(.failure(.alreadyRecording)); return }
      guard let connection: AVCaptureConnection = videoOutput.connection(with: .video) else { onVideoCaptureComplete(.failure(.noVideoConnection)); return }
      if connection.isVideoOrientationSupported {
         connection.videoOrientation = CamView.currentVideoOrientation
      }
      connection.isVideoMirrored = connection.isVideoMirroringSupported && device.position == .front
      guard let outputURL: URL = FileUtil.tempURL() else { onVideoCaptureComplete(.failure(.noTempFolderAccess)); return }
      videoOutput.startRecording(to: outputURL, recordingDelegate: self)
   }
   /**
    * Stops recording video
    */
    @objc open func stopRecordingVideo() {
      guard videoOutput.isRecording else { onVideoCaptureComplete(.failure(.alreadyStoppedRecording)); return }
      videoOutput.stopRecording()
   }
}
