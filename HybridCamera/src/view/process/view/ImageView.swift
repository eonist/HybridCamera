import UIKit

open class ImageView:UIImageView{
   open var url:URL?
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .clear
   }
   /**
    * TODO: ⚠️️ override image with didSet instead ? it's more swifty?
    */
   open func setImage(url:URL,image:UIImage){
      self.url = url
      self.image = image
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
