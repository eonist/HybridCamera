import UIKit
import AVFoundation
import ResultSugariOS
/**
 * Helper methods for setting up
 */
extension AVCaptureSession {
   /**
    * Setup camera
    * - Note: setCamera(cameraType) calls this method, so it can't be private
    */
   @objc open func setupCaptureDeviceInput(cameraPosition: AVCaptureDevice.Position) throws -> AVCaptureDeviceInput {
      let cameraResult: CamUtil.CameraResult = CamUtil.camera(devicePosition: cameraPosition)
      guard case .success(let captureDevice) = cameraResult else { // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
         throw SetupError.unableToGetVideoCaptureDevice(cameraResult.error())
      }
      do {
         self.inputs.forEach { self.removeInput($0) } // Removes previous inputs
         let input: AVCaptureDeviceInput = try AVCaptureDeviceInput(device: captureDevice) // Get an instance of the AVCaptureDeviceInput class using the previous device object.
         guard self.canAddInput(input) else { throw SetupError.unableToAddDeviceInputToReceiver }
         self.addInput(input) // Attatch the input device to the capture session.
         return input
      } catch let error {
         throw SetupError.unableToGetVideoCaptureDeviceInput(error)
      }
   }
   /**
    * Adds Video capabilities
    * - Parameter stabilizationMode: Some videos look quite shaky to me sometimes with .auto
    * - Throws: SetupError
    */
   @objc open func setupVideoCamera(output: AVCaptureMovieFileOutput, stabilizationMode: AVCaptureVideoStabilizationMode = .standard) throws {
      guard self.canAddOutput(output) else { throw SetupError.unableToAddVideoOutput }
      self.addOutput(output)
      guard let connection = output.connection(with: .video) else { throw SetupError.unableToCreateVideoConnection }
      if connection.isVideoStabilizationSupported { // Causes a glitch on enabled
         connection.preferredVideoStabilizationMode = stabilizationMode
      }
   }
   /**
    * Adds Photo capabilities
    */
   @objc open func setupPhotoCamera(output: AVCapturePhotoOutput) throws {
      output.isHighResolutionCaptureEnabled = true // Indicates whether the photo render pipeline should be configured to deliver high resolution still images.
      guard self.canAddOutput(output) else { throw SetupError.unableToAddPhotoOutput } // YES if the proposed output can be added to the receiver, NO otherwise.
      self.addOutput(output) // Set the output on the capture session
   }
   /**
    * Adds microphone capabilities
    * - Note: This is also called from CamView.setCamera
    */
   @objc open func setupMicrophone() throws {
      guard let microphone: AVCaptureDevice = .default(for: .audio) else {
         throw SetupError.unableToGetAudioCaptureDevice
      }
      do {
         let micInput = try AVCaptureDeviceInput(device: microphone)
         if self.canAddInput(micInput) {
            self.addInput(micInput)
         }
      } catch {
         throw SetupError.unableToGetAudioCaptureDeviceInput(error)
      }
   }
   /**
    * Adds support for background audio from other applications
    */
   @objc open func setupBackgroundAudioSupport(category: AVAudioSession.Category) throws {
      do {
         try AVAudioSession.sharedInstance().setCategory(category, mode: .default)
         try AVAudioSession.sharedInstance().setActive(true) // 👈 ref: https://stackoverflow.com/questions/51010390/avaudiosession-setcategory-swift-4-2-ios-12-play-sound-on-silent
         self.automaticallyConfiguresApplicationAudioSession = false
      }
      catch {
         throw SetupError.unableToActivateBackgroundAudio(error)
      }
   }
}
