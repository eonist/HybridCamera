import UIKit
import AVFoundation
import With
import ResultSugariOS

public class CamUtil {
   /**
    * Returns camera (.front or .back)
    * - Fixme: ⚠️️ make this try error based with meaningful error message
    * - Fixme: ⚠️️ maybe add support for the different cameras types, like wide, tele, normal, consider iphone 11
    * - Fixme: ⚠️️ Seems we only support wideAngleCamera for now?
    */
   public static func camera(devicePosition: AVCaptureDevice.Position, deviceType: AVCaptureDevice.DeviceType = .builtInWideAngleCamera) -> CameraResult {
      let session: AVCaptureDevice.DiscoverySession = .init(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .unspecified)
      let cameras: [AVCaptureDevice] = session.devices.compactMap { $0 }
      guard !cameras.isEmpty else { return .failure(.noCameraOfTypeAvailable(deviceType, cameras)) }
      guard let camera = cameras.first(where: { $0.position == devicePosition }) else { return .failure(.noPositionAvailableForDeviceType(devicePosition, deviceType)) }
      return .success(camera)
   }
   /**
    * Asserts video and mic access
    * - Note: https://stackoverflow.com/a/47688969/5389500
    */
   public static func assertVideoAndMicAccess(vc: UIViewController, onComplete:@escaping AssertMicAndVideoAccessComplete ) {
      assertVideoAccess(vc: vc) {
         guard case .success = $0 else { onComplete(.failure(.videoAccessWasDenied)); return }
         assertMicrophoneAccess(vc: vc, onComplete: onComplete)
      }
   }
}
/**
 * Private utility methods
 */
extension CamUtil {
   /**
    * Asserts video access
    * - Abstract: Prompts user if access is needed
    * - Parameter vc: the viewcontroller to present the Alert from
    */
   private static func assertVideoAccess(vc: UIViewController, onComplete:@escaping AssertMicAndVideoAccessComplete) {
      AVCaptureDevice.requestAccess(for: .video) { isGranted in // prompts the user for cam access
         guard !isGranted else { onComplete(.success(())); return }
         DispatchQueue.main.async {
            // Fixme: ⚠️️ use the dialog maker method on the bellow
            with(UIAlertController(title: "Camera", message: "This app does not have permission to access camera", preferredStyle: .alert)) {
               let action = UIAlertAction(title: "OK", style: .default) { _ in Swift.print("Do nothing, user needs to grant access from settings") }
               $0.addAction(action)
               vc.present($0, animated: true) { onComplete(.failure(.videoAccessWasDenied)) }
            }
         }
      }
   }
   /**
    * Asserts microphone access
    * - Fixme: ⚠️️ Use Result here with sucess or failure with meaningful err msg etc
    * - Parameter vc: the viewcontroller to present the Alert from
    */
   private static func assertMicrophoneAccess(vc: UIViewController, onComplete:@escaping AssertMicAndVideoAccessComplete) {
      let micStatus = AVCaptureDevice.authorizationStatus(for: .audio)
      switch micStatus {
      case .authorized: onComplete(.success(())) // Got access
      case .denied, .restricted: onComplete(.failure(.micDeniedOrRestricted)) // Microphone disabled in settings, No access granted
      case .notDetermined: // Didn't request access yet
         AVAudioSession.sharedInstance().requestRecordPermission { (granted: Bool) in
            granted ? onComplete(.success) : onComplete(.failure(.micAccessNotDetermined))
         }
      @unknown default: fatalError("Unknown case") }
   }
}
