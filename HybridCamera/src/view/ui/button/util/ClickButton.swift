
import UIKit


class ClickButton:RoundButton{
    var onClick:()->Void = { Swift.print("Default onClick()")}
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func buttonTouched(sender: UIButton) {
        onClick()
    }
}
