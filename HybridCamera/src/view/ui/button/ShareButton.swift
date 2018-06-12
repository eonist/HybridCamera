
import UIKit

class ShareButton:UIButton{
    var onClick:()->Void = { Swift.print("Default onClick()")}
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font =  .systemFont(ofSize: 14)
        self.setTitle("Share", for: .normal)
        self.layer.cornerRadius = frame.height/2
        self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
    }
    @objc func buttonTouched(sender:UIButton) {
         onClick()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

