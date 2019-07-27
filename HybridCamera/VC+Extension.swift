import UIKit
import HybridCamLib
import With
/**
 * Extension
 */
extension VC {
   /**
    * When camera accesses is granted proced to initiate the camera
    */
   func initiate() {
      let hybridCamView: CustomCamView = .init()
      self.view = hybridCamView /*Add HybridCamView as the main view*/
      hybridCamView.camView.onPhotoCaptureComplete = { [weak self] (image: UIImage?, url: URL?, error: Error?) in
         guard let self = self else { Swift.print("mem leak"); return }
         self.onCapture(image, url, error)
      }
      hybridCamView.camView.onVideoCaptureComplete = { [weak self] (url: URL?, error: Error?) in
         guard let self = self else { Swift.print("mem leak"); return }
         self.onCapture(nil, url, error)
      }
   }
   /**
    * When camera onCapture is called
    */
   //   guard self = self else { return }
   private func onCapture(_ image: UIImage?, _ url: URL?, _ error: Error?) {
      weak var _self = self // temp fix for possible mem leak
      guard let self = _self else { Swift.print("⚠️️ possible retian cycle ⚠️️"); return }
      self.processMediaView = {
         self.processMediaView = .init(frame: UIScreen.main.bounds)
         processMediaView?.onExit = {
            self.processMediaView?.deInitiate()
            self.processMediaView = nil
         }
         processMediaView?.onShare = { (url: URL?) in if let url = url { CustomProcessView.promptSaveFileDialog(vc: self, url: url) { self.processMediaView?.deInitiate() } } }
         self.view.addSubview(processMediaView!)
         return processMediaView
      }()
      if let error = error {
         CustomProcessView.promptErrorDialog(vc: self, error: error ) {
            Swift.print("error:  \(error)");
            self.processMediaView?.deInitiate()
            self.processMediaView = nil
         }; return
      } else {
         processMediaView?.present(image: image, url: url)
      }
   }
}
