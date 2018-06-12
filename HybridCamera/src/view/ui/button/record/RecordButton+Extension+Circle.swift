import UIKit

/**
 * Circle class
 */
extension RecordButton{
    class Circle:UIView{
        static let rect:CGRect = CGRect.init(origin: CGPoint(x:0,y:0), size: CGSize.init(width: RecordButton.width, height: RecordButton.height))
        lazy var inner:UIView = createInnerCircle()
        lazy var outer:UIView = createOuterCircle()
        override init(frame: CGRect) {
            super.init(frame: frame)
            _ = inner
            _ = outer
        }
        /**
         * Boilerplate
         */
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    func createCircle() -> RecordButton.Circle{
        let circle = RecordButton.Circle.init(frame: RecordButton.Circle.rect)
        RecordButton.addShadowToView(circle)
        addSubview(circle)
        return circle
    }
}
extension RecordButton.Circle{
    func createInnerCircle() -> UIView{
        let padding = self.frame.width/12
        let length = self.frame.width - (padding * 2)
        let frame = CGRect.init(origin: CGPoint.init(x: padding, y: padding), size: CGSize.init(width: length, height: length))
        let circle = UIView.init(frame: frame)
        circle.backgroundColor = .white//RecordButton.blue
        circle.layer.cornerRadius = length/2
        addSubview(circle)
        return circle
    }
    func createOuterCircle() -> UIView{
        let circle = UIView.init(frame: self.frame)
        circle.layer.borderWidth = 3
        circle.layer.borderColor = UIColor.white.cgColor
        circle.layer.cornerRadius = self.frame.width/2
        addSubview(circle)
        return circle
    }
}
