import UIKit
import With
/**
 * Style
 */
extension ZoomSwitcerBtn {
   /**
    * Config the button
    */
   @objc open func configButton() {
      with(self) {
         $0.backgroundColor = .white
         $0.setTitleColor(.black, for: .normal)
         $0.titleLabel?.font =  .systemFont(ofSize: 14)
         $0.setTitle("1x", for: .normal)
         $0.layer.cornerRadius = frame.height / 2
      }
   }
}
