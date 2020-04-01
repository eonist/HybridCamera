import UIKit
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
            DispatchQueue.main.async { [weak self] in // we have to jump on the main que again since requestAccess in onan arbitrary que
               do { try self?.initiate() } // If accesses was granted proced to initiate the camera
               catch { CustomProcessView.promptErrorDialog(vc: self, error: error) {} }
            }
         } else if case .failure(let error) = $0 {
            CustomProcessView.promptErrorDialog(vc: self, error: error, onComplete: { /*Do nothing*/ })
         }
      }
   }
   /**
    * - Fixme: ⚠️️ add support for orientaion later
    */
   override var shouldAutorotate: Bool { false } // Locks auto-rotate
   override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent } // Looks better when the background is dark
}
