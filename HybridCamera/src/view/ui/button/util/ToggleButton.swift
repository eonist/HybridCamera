import UIKit

class ToggleButton:RoundButton{
    var toggle:Bool = false
//    let colors:(on:UIColor,off:UIColor) = (.green,.red)
    var onToggle:(_ toggle:Bool)->Void = { toggle in Swift.print("Default onToggle: \(toggle)")}
    override init(frame: CGRect) {
        Swift.print("ToggleButton.init")
        super.init(frame: frame)
//        self.backgroundColor = toggle ? colors.on : colors.off
    }
    override func buttonTouched(sender: UIButton) {
        Swift.print("It Works!!!")
        toggle = !toggle
//        self.backgroundColor = toggle ? colors.on : colors.off//recording,idle
        onToggle(toggle)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

