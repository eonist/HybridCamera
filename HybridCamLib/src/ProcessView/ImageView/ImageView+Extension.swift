import Foundation
/**
 * Extension
 */
extension ImageView {
   /**
    * - Fixme: ⚠️️ override image with didSet instead ? it's more swifty?
    */
   @objc open func setImage(url: URL, image: UIImage) {
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
