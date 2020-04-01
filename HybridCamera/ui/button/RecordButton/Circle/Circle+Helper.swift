import UIKit
import With
/**
 * Private helper
 */
extension Circle {
   /**
    * Adds shadow to PARAM view
    * - Fixme: this can be moved to dediated class if needed
    */
   public static func addShadowToView(_ view: UIView) {
      with(view.layer) {
         $0.shadowColor = UIColor.black.cgColor
         $0.shadowOffset = .zero
         $0.shadowRadius = 3
         $0.shadowOpacity = 0.25
         $0.masksToBounds = false
      }
   }
}
