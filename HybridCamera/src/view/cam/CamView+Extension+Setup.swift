import UIKit
import AVFoundation

/**
 * Setup
 */
extension CamView{
    /**
     * NOTE: Setting device.focusMode = .continuousAutoFocus, device.exposureMode = .continuousAutoExposure could make the app better
     * TODO: ⚠️️ create a callback you can attach in init, to popup a alertdialog etc.
     */
    func setupDevice(){
        do {
            try setupCaptureDeviceInput(cameraType: .back)
            try setupVideoCamera()
            try setupMicrophone()
            try setupPhotoCamera()
            try setupBackgroundAudioSupport()
        } catch {
            Swift.print("error:  \(error.localizedDescription)")
        }
    }
    /**
     * Setup camera
     * IMPORTANT: setCamera(cameraType) calls this method, so it can't be private
     * TODO: ⚠️️ pass session as a var, and make it static
     * TODO: ⚠️️ pass cameraType as var, avides additional global vars in class
     */
    func setupCaptureDeviceInput(cameraType:AVCaptureDevice.Position) throws {
        guard let captureDevice:AVCaptureDevice = CamUtil.camera(type: cameraType) else {/*Get an instance of the AVCaptureDevice class to initialize a device object and provide the video as the media type parameter.*/
            throw SetupError.unableToGetVideoCaptureDevice
        }
        do {
            captureSession.inputs.forEach {captureSession.removeInput($0)}/*Removes previous inputs*/
            let input = try AVCaptureDeviceInput(device: captureDevice)/*Get an instance of the AVCaptureDeviceInput class using the previous device object.*/
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)/*attatch the input device to the capture session.*/
                self.deviceInput = input
            }
        } catch {
            throw error
        }
    }
    /**
     * Adds Video capabilities
     */
    private func setupVideoCamera() throws{
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
            guard let connection = videoOutput.connection(with: .video) else {throw SetupError.unableToCreateVideoConnection}
            if connection.isVideoStabilizationSupported {/*Causes a glitch on enabled*/
                connection.preferredVideoStabilizationMode = .auto
            }
        }else {
            throw SetupError.unableToAddVideoOutput
        }
    }
    /**
     * Adds Photo capabilities
     */
    private func setupPhotoCamera() throws{
        photoOutput.isHighResolutionCaptureEnabled = true
        if captureSession.canAddOutput(photoOutput) {
             captureSession.addOutput(photoOutput)// Set the output on the capture session
        }else {
            throw SetupError.unableToAddPhotoOutput
        }
    }
    /**
     * Adds microphone
     */
    private func setupMicrophone() throws{
        guard let microphone = AVCaptureDevice.default(for:.audio) else {
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
     */
    private func setupBackgroundAudioSupport(allowBackgroundAudio:Bool = true) throws{
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
            captureSession.automaticallyConfiguresApplicationAudioSession = false
        }
        catch {
            throw SetupError.unableToActivateBackgroundAudio
        }
    }
}
