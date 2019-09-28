import UIKit
import AVFoundation
import With
/**
 * Util
 */
extension ProcessView {
   /**
    * Prompts the save file dialog
    */
   @objc open class func promptSaveFileDialog(vc: UIViewController, url: URL, onComplete:@escaping OnSaveDialogComplete) {
      with(UIActivityViewController(activityItems: [url], applicationActivities: nil)) {
         $0.excludedActivityTypes = [UIActivity.ActivityType.airDrop]
         $0.popoverPresentationController?.sourceView = vc.view
         $0.completionWithItemsHandler = { (_ type: UIActivity.ActivityType?, _ flag: Bool, _ vals: [Any]?, _ error: Error?) in onComplete() }
         vc.present($0, animated: true, completion: nil)
      }
   }
   /**
    * Prompts the error dilog
    */
   @objc open class func promptErrorDialog(vc: UIViewController, error: Swift.Error, onComplete:@escaping OnErrorDialogComplete) {
      with(UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)) {
         let action: UIAlertAction = .init(title: "OK", style: .default) { _ in onComplete() }
         $0.addAction(action)
         vc.present($0, animated: true, completion: nil)
      }
   }
   /**
    * deInitiate
    */
   @objc open func deInitiate() {
      videoPlayerView.deInitiate() // Removes observer
      imageView.deInitiate()
      self.removeFromSuperview() // Removes it self from the view hierarchy
   }
}
