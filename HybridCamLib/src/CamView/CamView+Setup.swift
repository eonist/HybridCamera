import UIKit
import AVFoundation
/**
 * Setup
 */
extension CamView {
   /**
    * - Note: Setting device.focusMode = .continuousAutoFocus, device.exposureMode = .continuousAutoExposure could make the app better
    * - Throws: SetupError, can be used in init to forward meaningfull error message to user
    */
   @objc open func setupDevice() throws {
      self.deviceInput = try CamView.setupCaptureDeviceInput(captureSession, cameraPosition: .back)
      try CamView.setupVideoCamera(captureSession, output: videoOutput)
      try CamView.setupMicrophone(captureSession)
      try CamView.setupPhotoCamera(captureSession, output: photoOutput)
      try CamView.setupBackgroundAudioSupport(captureSession, category: .playAndRecord)
   }
}

// maybe add te setup to the capturesession as an extension, rename to setupCaptureSession

/**
 * Helper methods for setting up
 */
extension CamView {
   /**
    * Setup camera
    * - Note: setCamera(cameraType) calls this method, so it can't be private
    * - Fixme: ⚠️️ pass session as a var, and make it static
    */
   @objc open class func setupCaptureDeviceInput(_ session: AVCaptureSession, cameraPosition: AVCaptureDevice.Position) throws -> AVCaptureDeviceInput {
      let camera: CamUtil.CameraResult = CamUtil.camera(devicePosition: cameraPosition)
      guard case .success(let captureDevice) = camera else { // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.
         throw SetupError.unableToGetVideoCaptureDevice(camera.error())
      }
      do {
         session.inputs.forEach { session.removeInput($0) } // Removes previous inputs
         let input: AVCaptureDeviceInput = try AVCaptureDeviceInput(device: captureDevice) // Get an instance of the AVCaptureDeviceInput class using the previous device object.
         guard session.canAddInput(input) else { throw SetupError.unableToAddDeviceInputToReceiver }
         session.addInput(input) // Attatch the input device to the capture session.
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
   @objc open class func setupVideoCamera(_ session: AVCaptureSession, output: AVCaptureMovieFileOutput, stabilizationMode: AVCaptureVideoStabilizationMode = .standard) throws {
      guard session.canAddOutput(output) else { throw SetupError.unableToAddVideoOutput }
      session.addOutput(output)
      guard let connection = output.connection(with: .video) else { throw SetupError.unableToCreateVideoConnection }
      if connection.isVideoStabilizationSupported { // Causes a glitch on enabled
         connection.preferredVideoStabilizationMode = stabilizationMode
      }
   }
   /**
    * Adds Photo capabilities
    */
   @objc open class func setupPhotoCamera(_ session: AVCaptureSession, output: AVCapturePhotoOutput) throws {
      output.isHighResolutionCaptureEnabled = true // Indicates whether the photo render pipeline should be configured to deliver high resolution still images.
      guard session.canAddOutput(output) else { throw SetupError.unableToAddPhotoOutput } //  YES if the proposed output can be added to the receiver, NO otherwise.
      session.addOutput(output) // Set the output on the capture session
   }
   /**
    * Adds microphone capabilities
    * - Note: This is also called from CamView.setCamera
    */
   @objc open class func setupMicrophone(_ session: AVCaptureSession) throws {
      guard let microphone: AVCaptureDevice = .default(for: .audio) else {
         throw SetupError.unableToGetAudioCaptureDevice
      }
      do {
         let micInput = try AVCaptureDeviceInput(device: microphone)
         if session.canAddInput(micInput) {
            session.addInput(micInput)
         }
      } catch {
         throw SetupError.unableToGetAudioCaptureDeviceInput(error)
      }
   }
   /**
    * Adds support for background audio from other applications
    */
   @objc open class func setupBackgroundAudioSupport(_ session: AVCaptureSession, category: AVAudioSession.Category) throws {
      do {
         try AVAudioSession.sharedInstance().setCategory(category, mode: .default)
         try AVAudioSession.sharedInstance().setActive(true) // 👈 ref: https://stackoverflow.com/questions/51010390/avaudiosession-setcategory-swift-4-2-ios-12-play-sound-on-silent
         session.automaticallyConfiguresApplicationAudioSession = false
      }
      catch {
         throw SetupError.unableToActivateBackgroundAudio(error)
      }
   }
}
