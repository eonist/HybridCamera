import Foundation
import UIKit.UIImage
/**
 * Extension
 */
extension ImageView {
   /**
    * Sets image and url
    */
   @objc open func setImageAndURL(url: URL, image: UIImage) {
      self.url = url
      self.image = image
   }
   /**
    * Setting object to nil makes the observer work on the
    */
   @objc open func deInitiate() {
      self.image = nil
   }
}
