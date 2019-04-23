import UIKit
import HybridCamLib
import With

/**
 * Main view controller
 */
class VC:UIViewController{
   /**
    * We add the Camera view in the viewDidAppear so that its tricggered again after user changes the app prefs to allow video use
    */
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      CamUtil.assertVideoAndMicAccess(vc: self){ (success:Bool) in /*Goes through camera access wizard*/
         guard success else {return}
         DispatchQueue.main.async {
            self.initiate()/*If accesses was granted proced to initiate the camera*/
         }
      }
   }
   /**
    * TODO: ⚠️️ add support for orientaion later
    */
   override var shouldAutorotate: Bool  { return false }/*Locks autorotate*/
   override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}
/**
 * Extension
 */
extension VC{
   /**
    * When camera accesses is granted proced to initiate the camera
    */
   func initiate(){
      let hybridCamView:CustomCamView = .init()
      self.view = hybridCamView /*Add HybridCamView as the main view*/
      hybridCamView.camView.onPhotoCaptureComplete = onCapture
      hybridCamView.camView.onVideoCaptureComplete = { (url:URL?,error:Error?) in self.onCapture(nil,url,error)}
   }
   /**
    * When camera onCapture is called
    */
   private func onCapture(_ image:UIImage?,_ url:URL?,_ error:Error?) {
      let processMediaView:CustomProcessView = {
         let processMediaView = CustomProcessView.init(frame: UIScreen.main.bounds)
         processMediaView.onExit = { processMediaView.deInitiate() }
         processMediaView.onShare = { (url:URL?) in if let url = url { CustomProcessView.promptSaveFileDialog(vc: self, url: url, onComplete: {processMediaView.deInitiate()})} }
         self.view.addSubview(processMediaView)
         return processMediaView
      }()
      if let error = error {
         CustomProcessView.promptErrorDialog(vc: self, error: error, onComplete: { processMediaView.deInitiate() }); return
      }else {
         processMediaView.present(image: image, url: url)
      }
   }
}
