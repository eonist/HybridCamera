import UIKit
import HybridCamLib
import With
/**
 * Main view controller
 */
class ViewController: UIViewController {
   var processMediaView: CustomProcessView?
   /**
    * We add the Camera view in the viewDidAppear so that its tricggered again after user changes the app prefs to allow video use
    */
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      CamUtil.assertVideoAndMicAccess(vc: self) { // Sends user through camera access wizard
         if case .success = $0 {
            DispatchQueue.main.async { [weak self] in // - Fixme: ⚠️️ this main call may not be needed
               self?.initiate() // If accesses was granted proced to initiate the camera
            }
         } else if case .failure(let error) = $0 {
            CustomProcessView.promptErrorDialog(vc: self, error: error, onComplete: { /*Do nothing*/ })
         }
      }
   }
   /**
    * Fixme: ⚠️️ add support for orientaion later
    */
   override var shouldAutorotate: Bool { return false } // Locks autorotate
   override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent } // Looks better when the background is dark
}
