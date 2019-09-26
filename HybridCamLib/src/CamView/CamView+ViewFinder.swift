import UIKit
import AVFoundation
import With
/**
 * ViewFinder actions
 */
extension CamView {
   /**
    * Stops the camera preview
    */
   @objc open func stopPreview() {
      if captureSession.isRunning {
         captureSession.stopRunning()
      } else {
         Swift.print("capture session was already running 🚫")
      }
   }
   /**
    * Starts the camera preview
    * - Note: You might want to call this on a background thread if You have UI that animates after/before it's called
    */
   @objc open func startPreview() {
      if !captureSession.isRunning {
         captureSession.startRunning()
      } else {
         Swift.print("capture session wasn't running 🚫")
      }
   }
}
