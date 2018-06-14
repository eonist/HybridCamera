

import UIKit

class RoundButton:UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font =  .systemFont(ofSize: 12)
        self.layer.cornerRadius = frame.width/2
        self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
    }
    @objc func buttonTouched(sender:UIButton) {
        /*override in subclass*/
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

