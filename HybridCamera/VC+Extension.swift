import UIKit
import HybridCamLib
import With
import AVFoundation
/**
 * Extension
 */
extension ViewController {
   /**
    * When camera accesses is granted proced to initiate the camera
    */
   func initiate() {
      let hybridCamView: CustomCamView = .init()
      self.view = hybridCamView // Add HybridCamView as the main view
      hybridCamView.camView.onPhotoCaptureComplete = { [weak self] (image: UIImage?, url: URL?, error: Error?) in
         guard let self = self else { Swift.print("🚫"); return }
         self.onCapture(image, url, error)
      }
      hybridCamView.camView.onVideoCaptureComplete = { [weak self] (url: URL?, error: Error?) in
         guard let self = self else { Swift.print("🚫"); return }
         self.onCapture(nil, url, error)
      }
      self.resetZoom()
      self.switchAudioSession(to: .playAndRecord)
   }
   /**
    * When camera onCapture is called
    */
   private func onCapture(_ image: UIImage?, _ url: URL?, _ error: Error?) {
      weak var _self = self // temp fix for possible mem leak
      guard let self = _self else { Swift.print("⚠️️ possible retian cycle ⚠️️"); return }
      self.processMediaView = {
         self.processMediaView = .init(frame: UIScreen.main.bounds)
         processMediaView?.onExit = {
            self.processMediaView?.deInitiate()
            self.processMediaView = nil
            self.switchAudioSession(to: .playAndRecord)
         }
         processMediaView?.onShare = { (url: URL?) in if let url = url { CustomProcessView.promptSaveFileDialog(vc: self, url: url) { self.processMediaView?.deInitiate() } } }
         self.view.addSubview(processMediaView!)
         self.resetZoom()
         self.switchAudioSession(to: .playback)
         return processMediaView
      }()
      if let error = error {
         CustomProcessView.promptErrorDialog(vc: self, error: error ) {
            Swift.print("error:  \(error)")
            self.processMediaView?.deInitiate()
            self.processMediaView = nil
            self.resetZoom()
            self.switchAudioSession(to: .playAndRecord)
         }; return
      } else {
         processMediaView?.present(image: image, url: url)
      }
   }
   /**
    * Reset zoom with processMediaView
    */
   private func resetZoom() {
      guard let hybridCamView = self.view as? HybridCamView else { print("⚠️️ Could not reset zoom"); return }
      hybridCamView.camView.setZoomFactor(to: 1)
      hybridCamView.camView.startingZoomFactorForLongPress = 1
   }
   /**
    * Switch between audio session;
    * - Fixme: ⚠️️ Continue playing audio when going back to camera after preview
    */
   private func switchAudioSession(to: AVAudioSession.Category) {
      guard let hybridCamView = self.view as? HybridCamView else { print("⚠️️ Could not reset zoom"); return }
      do { try hybridCamView.camView.setupBackgroundAudioSupport(category: to) }
      catch { Swift.print("🚫 setupDevice error 🚫:  \((error as? SetupError)?.description ?? error.localizedDescription)") }
   }
}
