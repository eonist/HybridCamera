import UIKit
import AVFoundation
import With
/**
 * PhotoCamera
 */
extension AVCapturePhotoOutput {
   /**
    * Initiates capturing a photo, eventually calls: photoOutput() in the AVCapturePhotoCaptureDelegate class
    * - Note: it's also possible to use: stillImageOutput.captureStillImageAsynchronously to take a picture
    */
   @objc open func takePhoto(_ delegate: AVCapturePhotoCaptureDelegate, flashMode: AVCaptureDevice.FlashMode) {
      with(AVCapturePhotoSettings()) { // Get an instance of AVCapturePhotoSettings class
         $0.isAutoStillImageStabilizationEnabled = true // Set photo settings for our need
         $0.isHighResolutionPhotoEnabled = true
         $0.flashMode = flashMode
         self.capturePhoto(with: $0, delegate: delegate) // Call capturePhoto method by passing our photo settings and a delegate implementing AVCapturePhotoCaptureDelegate
      }
   }
}
