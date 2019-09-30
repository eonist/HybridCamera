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
      hybridCamView.camView.onPhotoCaptureComplete = defaultPhotoCaptureCompleted
      hybridCamView.camView.onVideoCaptureComplete = defaultVideoCaptureCompleted
      self.resetZoom()
      self.switchAudioSession(to: .playAndRecord)
   }
   /**
    * When camera onCapture is called
    */
   internal func onCapture(result: CamView.MediaCapture) {
      weak var _self = self // temp fix for possible mem leak
      guard let self = _self else { Swift.print("⚠️️ possible retian cycle ⚠️️"); return }
      self.processMediaView = createProcessView()
      if case .success(let value) = result {
         processMediaView?.present(image: value.image, url: value.url)
      } else if case .failure(let error) = result {
         CustomProcessView.promptErrorDialog(vc: self, error: error, onComplete: defaultOnErrorDialogComplete)
      }
   }
   /**
    * Reset zoom with processMediaView
    */
   internal func resetZoom() {
      try? (view as? HybridCamView)?.camView.deviceInput?.setZoomFactor(to: 1)
      (view as? HybridCamView)?.camView.startingZoomFactorForLongPress = 1
   }
   /**
    * Switch between audio session;
    * - Fixme: ⚠️️ Continue playing audio when going back to camera after preview
    * - Fixme: make this throw
    */
   internal func switchAudioSession(to: AVAudioSession.Category) {
      do {
         try (view as? HybridCamView)?.camView.captureSession.setupBackgroundAudioSupport(category: to)
      } catch { Swift.print("🚫 setupDevice error 🚫:  \((error as? SetupError)?.description ?? error.localizedDescription)") }
   }
}
