import UIKit
import AVFoundation
/**
 * Setup
 */
extension CamView {
   /**
    * - Note: Setting device.focusMode = .continuousAutoFocus, device.exposureMode = .continuousAutoExposure could make the app better
    * - Fixme: ⚠️️ create a callback you can attach in init, to popup a alert-dialog etc.
    * - Fixmr: ⚠️️ Use Result
    */
   @objc open func setupDevice() {
      do {
         try setupCaptureDeviceInput(cameraType: .back)
         try setupVideoCamera()
         try setupMicrophone()
         try setupPhotoCamera()
         try setupBackgroundAudioSupport(category: .playAndRecord)
      } catch {
         Swift.print("setupDevice error:  \((error as? SetupError)?.description ?? error.localizedDescription)")
      }
   }
   /**
    * Setup camera
    * - Import: setCamera(cameraType) calls this method, so it can't be private
    * - Fixme: ⚠️️ pass session as a var, and make it static
    * - Fixme: ⚠️️ pass cameraType as var, avides additional global vars in class
    * - Fixme: ⚠️️ Use Result here
    */
   @objc open func setupCaptureDeviceInput(cameraType: AVCaptureDevice.Position) throws {
      guard let captureDevice: AVCaptureDevice = CamUtil.camera(type: cameraType) else { // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
         throw SetupError.unableToGetVideoCaptureDevice
      }
      do {
         captureSession.inputs.forEach { captureSession.removeInput($0) } // Removes previous inputs
         let input: AVCaptureDeviceInput = try AVCaptureDeviceInput(device: captureDevice) // Get an instance of the AVCaptureDeviceInput class using the previous device object.
         if captureSession.canAddInput(input) {
            captureSession.addInput(input) // Attatch the input device to the capture session.
            self.deviceInput = input
         }
      } catch {
         throw error
      }
   }
}
/**
 * Helper methods for setting up (Private)
 */
extension CamView {
   /**
    * Adds Video capabilities
    */
   private func setupVideoCamera() throws {
      if captureSession.canAddOutput(videoOutput) {
         captureSession.addOutput(videoOutput)
         guard let connection = videoOutput.connection(with: .video) else { throw SetupError.unableToCreateVideoConnection }
         if connection.isVideoStabilizationSupported {/*Causes a glitch on enabled*/
            connection.preferredVideoStabilizationMode = .standard //some videos look quite shaky to me sometimes with .auto
         }
      } else {
          throw SetupError.unableToAddVideoOutput
      }
   }
   /**
    * Adds Photo capabilities
    */
   private func setupPhotoCamera() throws {
      photoOutput.isHighResolutionCaptureEnabled = true
      if captureSession.canAddOutput(photoOutput) {
         captureSession.addOutput(photoOutput) /*Set the output on the capture session*/
      } else {
         throw SetupError.unableToAddPhotoOutput
      }
   }
   /**
    * Adds microphone capabilities
    * Remark: This is also called from CamView.setCamera
    */
   func setupMicrophone() throws {
      guard let microphone: AVCaptureDevice = .default(for: .audio) else {
         throw SetupError.unableToGetAudioCaptureDevice
      }
      do {
         let micInput = try AVCaptureDeviceInput(device: microphone)
         if captureSession.canAddInput(micInput) {
            captureSession.addInput(micInput)
         }
      } catch {
         throw error
      }
   }
   /**
    * Adds support for background audio from other applications
    * - Fixme: ⚠️️ forward the error mesage from the try clause
    */
   open func setupBackgroundAudioSupport(category: AVAudioSession.Category) throws {
      do {
         try AVAudioSession.sharedInstance().setCategory(category, mode: .default)// try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord)
         try AVAudioSession.sharedInstance().setActive(true) //👈 ref: https://stackoverflow.com/questions/51010390/avaudiosession-setcategory-swift-4-2-ios-12-play-sound-on-silent
         captureSession.automaticallyConfiguresApplicationAudioSession = false
      }
      catch {
         throw SetupError.unableToActivateBackgroundAudio
      }
   }
}
