import UIKit
import With
/**
 * Button that is rounded
 */
open class RoundButton: UIButton {
   override public init(frame: CGRect) {
      super.init(frame: frame)
      with(self) {
         $0.backgroundColor = .gray
         $0.setTitleColor(.black, for: .normal)
         $0.titleLabel?.font =  .systemFont(ofSize: 12)
         $0.layer.cornerRadius = frame.width / 2
         $0.addTarget($0, action: #selector(self.buttonTouched), for: .touchUpInside)
      }
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
