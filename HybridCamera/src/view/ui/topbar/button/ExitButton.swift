import UIKit

//make exitBtn
//right
//green / red with text
class ExitButton:ClickButton{
    override init(frame: CGRect) {
        let rect = ExitButton.rect
        super.init(frame: rect)
        backgroundColor = .clear
        self.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static var rect:CGRect {
        let btnWidth:CGFloat = 30
        let topLeft:CGPoint = {
            let margin:CGFloat = 40
            return CGPoint.init(x: margin, y: margin)
        }()
        let rect = CGRect(x:topLeft.x, y:topLeft.y, width:btnWidth, height:btnWidth)
        return rect
    }
}
