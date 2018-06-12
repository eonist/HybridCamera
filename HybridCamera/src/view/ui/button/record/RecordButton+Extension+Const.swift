import UIKit

/**
 * Styling constants
 */
extension RecordButton{
    /**
     * Utility
     */
    static func addShadowToView(_ view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.25
        view.layer.masksToBounds = false
    }
}
/**
 * Size/Alignment
 */
extension RecordButton{
    static let width:CGFloat = 80
    static let height:CGFloat = RecordButton.width
    static let cornerRadius:CGFloat = RecordButton.width/2
    /**
     * Positions the RecordButton center bottom of the screen
     */
    func setPosition(){
        self.frame = RecordButton.rect
    }
    static var rect:CGRect {
        let btnWidth:CGFloat = RecordButton.width
        let bottomCenter:CGPoint = {
            let rect = UIScreen.main.bounds
            let bottomMargin:CGFloat = 20
            return CGPoint.init(x: rect.midX-(btnWidth/2), y: rect.height - btnWidth - bottomMargin)
        }()
        let rect = CGRect(x:bottomCenter.x, y:bottomCenter.y, width:btnWidth, height:btnWidth)
        return rect
    }
}
