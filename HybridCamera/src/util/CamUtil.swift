import UIKit
import AVFoundation

class CamUtil{
    /**
     * NOTE: file path becomes similar to: file:///private/var/mobile/Containers/Data/Application/7A735556D-364C-4D11-9E8A-6676BF11A1E1/tmp/F3888C7E-B1C6-49AC-9DV0-E4F92749204E.mp4
     * NOTE: Use NSDocumentDirectory for long term storage
     * NOTE: the TempDir wil get wiped automatically when the device run out of memory
     * NOTE: The nsuuidstring automagically creates a random unique filename every time it's called
     */
    static func tempURL(suffix:String =  ".mp4") -> URL? {
        let directory:String = NSTemporaryDirectory()
        guard directory != "" else { return nil }
        let url:URL = URL(fileURLWithPath: directory)
        let videoURL:URL = url.appendingPathComponent(NSUUID().uuidString + suffix)
        return videoURL
    }
    /**
     * EXAMPLE: FileModifier.write(path:"~/Desktop/del.txt".tildePath, data:data)//returns true or false depending on if something was written or not
     */
    static func write(path:String,data:Data) -> Bool{
        do {
            try data.write(to: URL(fileURLWithPath: path), options: [.atomic])
            return true
        } catch let error{
            print("failed to write file – bad permissions, bad filename, missing permissions, or something else error: \(error.localizedDescription)")
            return false
        }
    }
    /**
     * New
     */
    static func camera(type:AVCaptureDevice.Position) -> AVCaptureDevice? {
        let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .unspecified)
        let cameras:[AVCaptureDevice] = session.devices.compactMap { $0 }
        guard !cameras.isEmpty else { Swift.print("noCamerasAvailable");return nil }
        return cameras.first(where: {$0.position == type})
    }
    /**
     * Asserts video and mic access
     * NOTE: https://stackoverflow.com/a/47688969/5389500
     */
    static func assertVideoAndMicAccess(vc:UIViewController, onComplete:@escaping (_ success:Bool)->Void) {
        assertVideoAccess(vc: vc) { success in
            guard success else {onComplete(false);return}
            assertMicrophoneAccess(vc: vc, onComplete: onComplete)
        }
    }
    /**
     * Video
     */
    private static func assertVideoAccess(vc:UIViewController, onComplete:@escaping (_ success:Bool)->Void){
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { (granted: Bool) in
            if granted {
                onComplete(true)
            } else {
                DispatchQueue.main.async {
                    let alert: UIAlertController = UIAlertController(title: "Camera",message: "This app does not have permission to access camera",preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { _ in }
                    alert.addAction(action)
                    vc.present(alert, animated: true, completion: {onComplete(false)})
                }
            }
        }
    }
    /**
     * Microphone
     */
    private static func assertMicrophoneAccess(vc:UIViewController, onComplete:@escaping (_ success:Bool)->Void){
        let micStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        switch micStatus {
        case .authorized://got access
            onComplete(true)
        case .denied,.restricted:// Microphone disabled in settings, No access granted
            onComplete(false)
        case .notDetermined:// Didn't request access yet
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                if granted {
                    onComplete(true)
                } else {
                    onComplete(false)
                }
            })
        }
    }
}
