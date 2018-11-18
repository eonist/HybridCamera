import Foundation
/**
 * Events
 */
extension HybridCamView{
   /**
    * Attach CallBacks
    */
   @objc public func addEventHandlers() {
      recordButton.onShortPressRelease = {
         self.camView.takePhoto()
      }
      recordButton.onLongPressBegan = {
         self.camView.startRecording()
      }
      recordButton.onLongPressRelease = {
         self.camView.stopRecording()
      }
      topBar.flipButton.onToggle = { toggle in
         self.camView.setCamera(cameraType: toggle ? .front : .back)
      }
      topBar.flashButton.onToggle = { toggle in
         self.camView.setFlashMode(flashMode:  toggle ? .on : .off)
      }
      topBar.exitButton.onClick = {
         self.onCameraExit()
      }
   }
}
/**
 * Create
 */
extension HybridCamView{
   /**
    * Creates camview
    */
   @objc open func createCamView() -> CamView{
      let rect = CGRect.init(origin: .zero, size: UIScreen.main.bounds.size)
      let camView = CamView(frame: rect)
      self.addSubview(camView)
      return camView
   }
   /**
    * Creates topbar
    */
   @objc open func createTopBar() -> TopBarViewKind {
      fatalError("must be overriden in subclass")
   }
   /**
    * Creates Record button
    */
   @objc open func createRecordButton() -> RecordButtonViewKind{
      fatalError("must be overriden in subclass")
   }
}
/**
 * CallBack signature
 */
extension HybridCamView {
   public typealias OnCameraExit = () -> Void
   public static var defaultOnCameraExit:OnCameraExit {return {Swift.print("default onCameraExit")}}
}
