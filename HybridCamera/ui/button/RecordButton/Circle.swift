import UIKit
import With
/**
 * Circle class (Creates RecordButton)
 * - Fixme: ⚠️️ Do this on didLayout instead, as you don't have frame when using AutoLayout
 */
open class Circle: UIView {
   open lazy var inner: UIView = self.createInnerCircle()
   open lazy var outer: UIView = self.createOuterCircle()
   override init(frame: CGRect) {
      super.init(frame: frame)
      _ = inner
      _ = outer
      Circle.addShadowToView(self)
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
