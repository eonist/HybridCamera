import UIKit

open class ImageView: UIImageView {
   open var url: URL? // File url of where the image is located
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .clear
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
