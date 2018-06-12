
import UIKit

class TopBar:UIView{
    lazy var exitButton:ExitButton = createExitButton()
    lazy var flipButton:FlipButton = createFlipButton()
    lazy var flashButton:FlashButton = createFlashButton()
    override init(frame:CGRect){
        super.init(frame: frame)
        _ = exitButton
        _ = flipButton
        _ = flashButton
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopBar{
    func createExitButton() -> ExitButton{
        let btn = ExitButton()
        self.addSubview(btn)
        return btn
    }
    func createFlashButton() -> FlashButton{
        let btn = FlashButton()
        self.addSubview(btn)
        return btn
    }
    func createFlipButton() -> FlipButton{
        let btn = FlipButton()
        self.addSubview(btn)
        return btn
    }
}
