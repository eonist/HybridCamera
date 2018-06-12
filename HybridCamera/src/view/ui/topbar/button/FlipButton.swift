import UIKit

//make flipBtn (toggle)
//center
//green / red with text
class FlipButton:ToggleButton{
    override init(frame: CGRect) {
        super.init(frame: FlipButton.rect)
         backgroundColor = .clear
        self.setImage(#imageLiteral(resourceName: "flipCamera"), for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static var rect:CGRect {
        let btnWidth:CGFloat = 30
        let topCenter:CGPoint = {
            let rect = UIScreen.main.bounds
            let margin:CGFloat = 40
            return CGPoint.init(x: (rect.width/2)-(btnWidth/2), y: 0 + margin)
        }()
        let rect = CGRect(x:topCenter.x, y:topCenter.y, width:btnWidth, height:btnWidth)
        return rect
    }
}
