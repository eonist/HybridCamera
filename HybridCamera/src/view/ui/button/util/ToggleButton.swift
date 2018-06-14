import UIKit

class ToggleButton:RoundButton{
    var toggle:Bool = false
    var onToggle:(_ toggle:Bool)->Void = { toggle in Swift.print("Default onToggle: \(toggle)")}
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func buttonTouched(sender: UIButton) {
        toggle = !toggle
        onToggle(toggle)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

