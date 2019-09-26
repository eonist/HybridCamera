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
      with(recordButton) { // Attach callbacks to recordButton
         $0.onShortPressRelease = { self.camView.takePhoto() }
         $0.onLongPressBegan = { self.camView.startRecording() }
         $0.onLongPressRelease = { self.camView.stopRecording() }
         $0.onLongPressChanged = { addZoom in self.camView.zoomViaRecord(addZoom: addZoom) }
      }
      with(topBar) { // Attach callbacks to topBar
         $0.flipButton.onToggle = { toggle in self.camView.setCamera(cameraType: toggle ? .front : .back) }
         $0.flashButton.onToggle = { toggle in self.camView.setFlashMode(flashMode: toggle ? .on : .off) }
         $0.exitButton.onClick = { self.onCameraExit() }
      }
   }
}
