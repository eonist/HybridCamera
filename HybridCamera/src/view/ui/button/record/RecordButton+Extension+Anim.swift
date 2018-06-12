import UIKit

/**
 * Animation
 */
extension RecordButton{
    /**
     * Grow the button (Animation)
     */
    func grow(){
        let anim = UIViewPropertyAnimator.init(duration: 0.5, curve: .easeOut){
            self.circle.inner.backgroundColor = .red
        }
        anim.startAnimation()
    }
    /**
     * Shrink the button  (Animation)
     */
    func shrink(){
        let anim = UIViewPropertyAnimator.init(duration: 0.15, curve: .linear){
            self.circle.inner.backgroundColor = .white
        }
        anim.startAnimation()
    }
}
