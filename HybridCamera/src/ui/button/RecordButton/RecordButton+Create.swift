import With

extension RecordButton {
   /**
    * Creates circle
    */
   @objc open func createCircle() -> Circle {
      return with(.init(frame: Circle.rect)) {
         addSubview($0)
      }
   }
}
