
import UIKit

class ImageView:UIImageView{
    var url:URL?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    func setImage(url:URL,image:UIImage){
        self.url = url
        self.image = image
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
