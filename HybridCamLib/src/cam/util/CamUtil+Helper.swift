import UIKit
import AVFoundation
import With
/**
 * Private utility methods
 */
extension CamUtil {
   /**
    * Asserts video access
    */
   internal static func assertVideoAccess(vc: UIViewController, onComplete:@escaping AssertComplete){
      AVCaptureDevice.requestAccess(for: AVMediaType.video) { (granted: Bool) in
         if granted {
            onComplete(true)
         } else {
            DispatchQueue.main.async {
               with(UIAlertController(title: "Camera", message: "This app does not have permission to access camera", preferredStyle: .alert)) {
                  let action = UIAlertAction(title: "OK", style: .default) { _ in Swift.print("Do nothing") }
                  $0.addAction(action)
                  vc.present($0, animated: true) { onComplete(false) }
               }
            }
         }
      }
   }
   /**
    * Asserts microphone access
    */
   internal static func assertMicrophoneAccess(vc: UIViewController, onComplete:@escaping AssertComplete) {
      let micStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
      switch micStatus {
      case .authorized:/* Got access */ onComplete(true)
      case .denied, .restricted: onComplete(false)/*Microphone disabled in settings, No access granted*/
      case .notDetermined:/*Didn't request access yet*/
         AVAudioSession.sharedInstance().requestRecordPermission{ (granted: Bool) in
            onComplete(granted)
         }
      @unknown default: fatalError("Unknown case") }
   }
}
