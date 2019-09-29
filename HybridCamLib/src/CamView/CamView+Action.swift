import UIKit
import AVFoundation
import With
/**
 * VideoCamera actions
 */
extension CamView {
   /**
    * Starts recording video
    * - Fixme: add Result here
    */
   @objc open func startRecording() {
      guard let device: AVCaptureDevice = deviceInput?.device else { onVideoCaptureComplete(.failure(.noInputDevice)); return }
      if device.isSmoothAutoFocusSupported {
         do {
            try device.lockForConfiguration()
            device.isSmoothAutoFocusEnabled = false
            device.unlockForConfiguration()
         } catch {
            onVideoCaptureComplete(.failure(.unableToLockForConfiguration))
         }
      }
      guard videoOutput.isRecording == false else { onVideoCaptureComplete(.failure(.alreadyRecording)); return }
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
    * - Fixme: add Result here
    */
    @objc open func stopRecording() {
      guard videoOutput.isRecording else { onVideoCaptureComplete(.failure(.alreadyStoppedRecording)); return }
      videoOutput.stopRecording()
   }
}
