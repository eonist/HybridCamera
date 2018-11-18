import UIKit

/**
 * Events
 */
extension HybridCamView{
   /**
    * Attach CallBacks
    */
   @objc public func addEventHandlers(){
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
   @objc open func createTopBar() -> TopBar {
      let rect = CGRect.init(origin: .init(), size: CGSize.init(width: UIScreen.main.bounds.size.width, height: 120))
      let topBar = TopBar.init(frame: rect)
      self.addSubview(topBar)
      return topBar
   }
   /**
    * Creates Record button
    */
   @objc open func createRecordButton() -> RecordButton{
      let btn = RecordButton()
      self.addSubview(btn)
      btn.setPosition()
      return btn
   }
}
/**
 * CallBack signature
 */
extension HybridCamView{
   public typealias OnCameraExit = () -> Void
   public static let defaultOnCameraExit:OnCameraExit = {Swift.print("default onCameraExit")}
}


