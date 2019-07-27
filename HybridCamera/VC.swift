import UIKit
import HybridCamLib
import With

/**
 * Main view controller
 */
class VC: UIViewController {
   var processMediaView: CustomProcessView?
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
