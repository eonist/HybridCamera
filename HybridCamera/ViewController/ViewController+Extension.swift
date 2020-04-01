import UIKit
import With
import AVFoundation
/**
 * Extension
 */
extension ViewController {
   /**
    * When camera accesses is granted proced to initiate the camera
    */
   func initiate() throws {
      let hybridCamView: CustomCamView = .init()
      self.view = hybridCamView // Add HybridCamView as the main view
      hybridCamView.camView.onPhotoCaptureComplete = defaultPhotoCaptureCompleted
      hybridCamView.camView.onVideoCaptureComplete = defaultVideoCaptureCompleted
      try self.resetZoom()
      try self.switchAudioSession(to: .playAndRecord)
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
   internal func resetZoom() throws {
      try (view as? HybridCamView)?.camView.deviceInput?.setZoomFactor(to: 1)
      (view as? HybridCamView)?.camView.startingZoomFactorForLongPress = 1
   }
   /**
    * Switch between audio session;
    * - Fixme: ⚠️️ may instead of throwing, we should return Result<Void,SetupError>
    * - Fixme: make this throw
    */
   internal func switchAudioSession(to category: AVAudioSession.Category) throws {
      try (view as? HybridCamView)?.camView.captureSession.setupBackgroundAudioSupport(category: category)
   }
}
