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
   @objc open func stopRecording() {
      guard videoOutput.isRecording else { onVideoCaptureComplete(nil, CaptureError.alreadyStoppedRecording); return }
      videoOutput.stopRecording()
   }
   /**
    * - Fixme: ⚠️️ After going back to camView after seeing recorded video, reset zoom: setZoom(zoomFactor: 1) needs to be called and startingZoomFactorForLongPress = 1
    * - Fixme: Explain what this method does
    */
   @objc open func zoomViaRecord(addZoom: CGFloat) {
      try? deviceInput?.setZoomFactor(to: startingZoomFactorForLongPress + addZoom)
   }
}
/**
 * PhotoCamera
 */
extension CamView {
   /**
    * Initiates capturing a photo, eventually calls: photoOutput() in the AVCapturePhotoCaptureDelegate class
    * - Note: it's also possible to use: stillImageOutput.captureStillImageAsynchronously to take a picture
    */
   @objc open func takePhoto() {
      with(AVCapturePhotoSettings()) { // Get an instance of AVCapturePhotoSettings class
         $0.isAutoStillImageStabilizationEnabled = true // Set photo settings for our need
         $0.isHighResolutionPhotoEnabled = true
         $0.flashMode = self.flashMode
         photoOutput.capturePhoto(with: $0, delegate: self) // Call capturePhoto method by passing our photo settings and a delegate implementing AVCapturePhotoCaptureDelegate
      }
   }
}
