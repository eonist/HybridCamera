import UIKit
import HybridCamLib
import With

/**
 * Main view controller
 */
class VC: UIViewController {
   /**
    * We add the Camera view in the viewDidAppear so that its tricggered again after user changes the app prefs to allow video use
    */
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      CamUtil.assertVideoAndMicAccess(vc: self) { (success: Bool) in /*Goes through camera access wizard*/
         guard success else { return }
         DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.initiate()/*If accesses was granted proced to initiate the camera*/
         }
      }
   }
   /**
    * Fixme: ⚠️️ add support for orientaion later
    */
   override var shouldAutorotate: Bool { return false }/*Locks autorotate*/
   override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}
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
      self.resetZoom()
   }
   /**
    * When camera onCapture is called
    */
//   guard self = self else { return }
   private func onCapture(_ image: UIImage?, _ url: URL?, _ error: Error?) {
      weak var _self = self // temp fix for possible mem leak
      guard let self = _self else { Swift.print("⚠️️ possible retian cycle ⚠️️"); return }
      let processMediaView: CustomProcessView = {
         let processMediaView: CustomProcessView = .init(frame: UIScreen.main.bounds)
         processMediaView.onExit = {
             processMediaView.deInitiate()
         }
         processMediaView.onShare = { (url: URL?) in if let url = url { CustomProcessView.promptSaveFileDialog(vc: self, url: url) { processMediaView.deInitiate() } } }
         self.view.addSubview(processMediaView)
         self.resetZoom() //Fixme: Placement may be a little awkward here
         return processMediaView
      }()
      if let error = error {
         CustomProcessView.promptErrorDialog(vc: self, error: error ) {
            processMediaView.deInitiate()
            self.resetZoom()
         }
         return
      } else {
         processMediaView.present(image: image, url: url)
      }
   }
   /**
    * Reset zoom with processMediaView
    */
   private func resetZoom() {
      guard let hybridCamView = self.view as? HybridCamView else {
         print("HybridCamera: Could not reset zoom")
         return
      }
      hybridCamView.camView.setZoom(zoomFactor: 1)
      hybridCamView.camView.startingZoomFactorForLongPress = 1
   }
}
