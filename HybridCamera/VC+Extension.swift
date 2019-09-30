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
   
   // should throw
   // store the closures in defaultOnPhoto....etc
   
   func initiate() {
      let hybridCamView: CustomCamView = .init()
      self.view = hybridCamView // Add HybridCamView as the main view
      hybridCamView.camView.onPhotoCaptureComplete = { [weak self] in
         guard let self = self else { Swift.print("🚫"); return }
         if case .success(let value) = $0 {
            self.onCapture(result: .success((value.image, value.url)))
         } else if case .failure(let error) = $0 {
            self.onCapture(result: .failure(error))
         }
      }
      hybridCamView.camView.onVideoCaptureComplete = { [weak self] in //(url: URL?, error: Error?) in
         guard let self = self else { Swift.print("🚫"); return }
         if case .success(let value) = $0 {
            self.onCapture(result: .success((nil, value)))
         } else if case .failure(let error) = $0 {
            self.onCapture(result: .failure(error))
         }
      }
      self.resetZoom()
      self.switchAudioSession(to: .playAndRecord)
   }
   /**
    * When camera onCapture is called
    */
   private func onCapture(result: CamView.MediaCapture) {
      weak var _self = self // temp fix for possible mem leak
      guard let self = _self else { Swift.print("⚠️️ possible retian cycle ⚠️️"); return }
      self.processMediaView = {
         self.processMediaView = .init(frame: UIScreen.main.bounds)
         processMediaView?.onExit = {
            self.processMediaView?.deInitiate()
            self.processMediaView = nil
            self.switchAudioSession(to: .playAndRecord)
         }
         processMediaView?.onShare = { (url: URL?) in
            // Fixme: ⚠️️ move this closure into a defaultOnShareBehaviour var
            if let url = url { CustomProcessView.promptSaveFileDialog(vc: self, url: url) { self.processMediaView?.deInitiate() } }
         }
         self.view.addSubview(processMediaView!)
         self.resetZoom()
         self.switchAudioSession(to: .playback)
         return processMediaView
      }()
      if case .success(let value) = result {
         processMediaView?.present(image: value.image, url: value.url)
      } else if case .failure(let error) = result {
         CustomProcessView.promptErrorDialog(vc: self, error: error ) { // onComplete
            Swift.print("error:  \(error)")
            self.processMediaView?.deInitiate()
            self.processMediaView = nil
            self.resetZoom()
            self.switchAudioSession(to: .playAndRecord)
         }; return
      }
   }
   /**
    * Reset zoom with processMediaView
    */
   private func resetZoom() {
      try? (view as? HybridCamView)?.camView.deviceInput?.setZoomFactor(to: 1)
      (view as? HybridCamView)?.camView.startingZoomFactorForLongPress = 1
   }
   /**
    * Switch between audio session;
    * - Fixme: ⚠️️ Continue playing audio when going back to camera after preview
    * - Fixme: make this throw
    */
   private func switchAudioSession(to: AVAudioSession.Category) {
      do {
         try (view as? HybridCamView)?.camView.captureSession.setupBackgroundAudioSupport(category: to)
      }
      catch { Swift.print("🚫 setupDevice error 🚫:  \((error as? SetupError)?.description ?? error.localizedDescription)") }
   }
}
