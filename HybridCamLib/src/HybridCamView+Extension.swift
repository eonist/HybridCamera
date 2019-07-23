import Foundation
import With
/**
 * Events
 */
extension HybridCamView {
   /**
    * Attach CallBacks
    */
   @objc public func addEventHandlers() {
      with(recordButton) {
         $0.onShortPressRelease = { self.camView.takePhoto() }
         $0.onLongPressBegan = { self.camView.startRecording() }
         $0.onLongPressRelease = { self.camView.stopRecording() }
         $0.onLongPressChanged = { addZoom in self.camView.zoomViaRecord(addZoom: addZoom) }
      }
      with(topBar) {
         $0.flipButton.onToggle = { toggle in self.camView.setCamera(cameraType: toggle ? .front : .back) }
         $0.flashButton.onToggle = { toggle in self.camView.setFlashMode(flashMode: toggle ? .on : .off) }
         $0.exitButton.onClick = { self.onCameraExit() }
      }
   }
}
/**
 * Create
 */
extension HybridCamView {
   /**
    * Creates camView
    */
   @objc open func createCamView() -> CamView {
      let rect: CGRect = .init(origin: .zero, size: UIScreen.main.bounds.size)
      return with(.init(frame: rect)) {
         self.addSubview($0)
      }
   }
   /**
    * Creates topBar
    */
   @objc open func createTopBar() -> TopBarViewKind {
      fatalError("must be overriden in subclass")
   }
   /**
    * Creates Record button
    */
   @objc open func createRecordButton() -> RecordButtonViewKind {
      fatalError("must be overriden in subclass")
   }
}
/**
 * CallBack signature
 */
extension HybridCamView {
   public typealias OnCameraExit = () -> Void
   public static var defaultOnCameraExit: OnCameraExit { return { Swift.print("default onCameraExit") } }
}
