import With
import Foundation

extension RecordButton {
   /**
    * Creates circle
    */
   @objc open func createCircle() -> Circle {
      with(.init(frame: Circle.rect)) {
         addSubview($0)
      }
   }
}
