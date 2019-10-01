import UIKit
/**
 * Animation
 */
extension RecordButton {
   /**
    * Grow the button (Animation)
    */
   open class func grow(view: UIView) {
      let anim: UIViewPropertyAnimator = .init(duration: 0.5, curve: .easeOut) {
         view.backgroundColor = .red
      }
      anim.startAnimation()
   }
   /**
    * Shrink the button (Animation)
    */
   open class func shrink(view: UIView) {
      let anim: UIViewPropertyAnimator = .init(duration: 0.15, curve: .linear) {
         view.backgroundColor = .white
      }
      anim.startAnimation()
   }
}
