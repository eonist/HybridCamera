import UIKit
import AVFoundation
import With
/**
 * Private utility methods
 */
extension CamUtil {
   /**
    * Asserts video access
    * - Abstract: Prompts user if access is needed
    */
   internal static func assertVideoAccess(vc: UIViewController, onComplete:@escaping AssertComplete) {
      AVCaptureDevice.requestAccess(for: .video) { isGranted in
         if isGranted { onComplete(true) }
         else {
            DispatchQueue.main.async {
               with(UIAlertController(title: "Camera", message: "This app does not have permission to access camera", preferredStyle: .alert)) {
                  let action = UIAlertAction(title: "OK", style: .default) { _ in Swift.print("Do nothing, user needs to grant access from settings") }
                  $0.addAction(action)
                  vc.present($0, animated: true) { onComplete(false) }
               }
            }
         }
      }
   }
   /**
    * Asserts microphone access
    * - Fixme: ⚠️️ Use Result here with sucess or failure with meaningful err msg etc
    */
   internal static func assertMicrophoneAccess(vc: UIViewController, onComplete:@escaping AssertComplete) {
      let micStatus = AVCaptureDevice.authorizationStatus(for: .audio)
      switch micStatus {
      case .authorized: onComplete(true) // Got access
      case .denied, .restricted: onComplete(false) // Microphone disabled in settings, No access granted
      case .notDetermined: // Didn't request access yet
         AVAudioSession.sharedInstance().requestRecordPermission { (granted: Bool) in
            onComplete(granted)
         }
      @unknown default: fatalError("Unknown case") }
   }
}