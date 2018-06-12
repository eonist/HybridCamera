import UIKit
import AVFoundation

/**
 * ViewFinder actions
 */
extension CamView{
    /**
     * Stops the camera preview
     */
    func stopPreview(){
        Swift.print("CamViewController.stop()")
        if captureSession.isRunning {
            captureSession.stopRunning()
        }else {
            Swift.print("capture session was already running 🚫")
        }
    }
    /**
     * Starts the camera preview
     */
    func startPreview(){
        Swift.print("CamViewController.start()")
        if !captureSession.isRunning {
            captureSession.startRunning()
        }else {
            Swift.print("capture session wasn't running 🚫")
        }
    }
}
/**
 * VideoCamera actions
 */
extension CamView{
    /**
     * Starts recording video
     */
    func startRecording() {
//        Swift.print("startRecording 🎥 \(videoOutput.isRecording)")
        guard videoOutput.isRecording == false else {onVideoCaptureComplete(nil,CaptureError.alreadyRecording); return}
        guard let connection = videoOutput.connection(with: .video) else {onVideoCaptureComplete(nil,CaptureError.noVideoConnection);return}
        if connection.isVideoOrientationSupported {
            connection.videoOrientation = CamView.currentVideoOrientation
        }
        guard let device:AVCaptureDevice = deviceInput?.device else {onVideoCaptureComplete(nil,CaptureError.noInputDevice);return}
        if device.isSmoothAutoFocusSupported {
            do {
                try device.lockForConfiguration()
                device.isSmoothAutoFocusEnabled = false
                device.unlockForConfiguration()
            } catch {
                Swift.print("Error setting configuration: \(error)")
            }
        }
        guard let outputURL:URL = CamUtil.tempURL() else {  onVideoCaptureComplete(nil,CaptureError.noTempFolderAccess);return}
        videoOutput.startRecording(to: outputURL, recordingDelegate: self)
    }
    /**
     * Stops recording video
     */
    func stopRecording() {
//        Swift.print("stopRecording 🚫 \(videoOutput.isRecording)")
        guard  videoOutput.isRecording else { onVideoCaptureComplete(nil,CaptureError.alreadyStoppedRecording);return}
        videoOutput.stopRecording()
    }
}
/**
 * PhotoCamera
 */
extension CamView{
    /**
     * Initiates capturing a photo, eventually calls: photoOutput() in the AVCapturePhotoCaptureDelegate class
     * NOTE: it's also possible to use: stillImageOutput.captureStillImageAsynchronously to take a picture
     */
    func takePhoto() {
//        Swift.print("takePhoto")
//        guard let capturePhotoOutput = self.capturePhotoOutput else { return }// Make sure capturePhotoOutput is valid
        let photoSettings:AVCapturePhotoSettings = {// Get an instance of AVCapturePhotoSettings class
            let photoSettings = AVCapturePhotoSettings()
            photoSettings.isAutoStillImageStabilizationEnabled = true// Set photo settings for our need
            photoSettings.isHighResolutionPhotoEnabled = true
            photoSettings.flashMode = self.flashMode
            return photoSettings
        }()
        photoOutput.capturePhoto(with: photoSettings, delegate: self)// Call capturePhoto method by passing our photo settings and a delegate implementing AVCapturePhotoCaptureDelegate
    }
}



