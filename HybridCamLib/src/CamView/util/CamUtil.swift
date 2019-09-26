import UIKit
import AVFoundation

public class CamUtil {
   /**
    * Returns camera (.front or .back)
    * - Fixme: ⚠️️ make this try error based with meaningful error message
    */
   public static func camera(type: AVCaptureDevice.Position) -> AVCaptureDevice? {
      let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .unspecified)
      let cameras: [AVCaptureDevice] = session.devices.compactMap { $0 }
      guard !cameras.isEmpty else { Swift.print("noCamerasAvailable"); return nil }
      return cameras.first { $0.position == type }
   }
   /**
    * Asserts video and mic access
    * - Note: https://stackoverflow.com/a/47688969/5389500
    */
   public static func assertVideoAndMicAccess(vc: UIViewController, onComplete:@escaping AssertComplete ) {
      assertVideoAccess(vc: vc) { success in
         guard success else { onComplete(false); return }
         assertMicrophoneAccess(vc: vc, onComplete: onComplete)
      }
   }
}
