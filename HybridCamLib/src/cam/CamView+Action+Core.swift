import UIKit
import AVFoundation
import With
/**
 * ViewFinder actions
 */
extension CamView {
   /**
    * Stops the camera preview
    */
   @objc open func stopPreview() {
      if captureSession.isRunning {
         captureSession.stopRunning()
      } else {
         Swift.print("capture session was already running 🚫")
      }
   }
   /**
    * Starts the camera preview
    * - Note: You might want to call this on a background thread if You have UI that animates after/before it's called
    */
   @objc open func startPreview() {
      if !captureSession.isRunning {
         captureSession.startRunning()
      } else {
         Swift.print("capture session wasn't running 🚫")
      }
   }
}
/**
 * VideoCamera actions
 */
extension CamView {
   /**
    * Starts recording video
    */
   @objc open func startRecording() {
      guard videoOutput.isRecording == false else { onVideoCaptureComplete(nil, CaptureError.alreadyRecording); return }
      guard let connection: AVCaptureConnection = videoOutput.connection(with: .video) else { onVideoCaptureComplete(nil, CaptureError.noVideoConnection); return }
      if connection.isVideoOrientationSupported {
         connection.videoOrientation = CamView.currentVideoOrientation
         
      }
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
      connection.isVideoMirrored = connection.isVideoMirroringSupported && device.position == .front // mirror front camera, Fixme: ⚠️️ Possibly move the connection bellow the device creation. to keep connection related code together, this requires testing
      guard let outputURL: URL = CamUtil.tempURL() else { onVideoCaptureComplete(nil, CaptureError.noTempFolderAccess); return }
      videoOutput.startRecording(to: outputURL, recordingDelegate: self)
   }
   /**
    * Stops recording video
    */
   @objc open func stopRecording() {
      guard videoOutput.isRecording else { onVideoCaptureComplete(nil, CaptureError.alreadyStoppedRecording); return }
      videoOutput.stopRecording()
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
      with(AVCapturePhotoSettings()) {/*Get an instance of AVCapturePhotoSettings class*/
         $0.isAutoStillImageStabilizationEnabled = true/*Set photo settings for our need*/
         $0.isHighResolutionPhotoEnabled = true
         $0.flashMode = self.flashMode
         photoOutput.capturePhoto(with: $0, delegate: self)/*Call capturePhoto method by passing our photo settings and a delegate implementing AVCapturePhotoCaptureDelegate*/
      }
   }
}
