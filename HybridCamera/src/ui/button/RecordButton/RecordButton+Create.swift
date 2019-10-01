import With

extension RecordButton {
   /**
    * Creates circle
    */
   @objc open func createCircle() -> Circle {
      return with(.init(frame: Circle.rect)) {
         RecordButton.addShadowToView($0)
         addSubview($0)
      }
   }
}
