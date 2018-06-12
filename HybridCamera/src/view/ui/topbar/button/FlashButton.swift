import UIKit

class FlashButton:ToggleButton{
    override init(frame: CGRect) {
        super.init(frame: FlashButton.rect)
         backgroundColor = .clear
        self.setImage(#imageLiteral(resourceName: "flash"), for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static var rect:CGRect {
        let btnWidth:CGFloat = 30
        let topRight:CGPoint = {
            let rect = UIScreen.main.bounds
            let margin:CGFloat = 40
            return CGPoint.init(x: rect.width-(btnWidth)-margin, y: 0 + margin)
        }()
        let rect = CGRect(x:topRight.x, y:topRight.y, width:btnWidth, height:btnWidth)
        return rect
    }
}
