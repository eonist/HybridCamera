import Foundation
import With
/**
 * Events
 */
extension HybridCamView {
   /**
    * Attach CallBacks
    * - Fixme: add support for auto flashmode?
    */
   @objc public func addEventHandlers() {
      with(recordButton) { // Attach callbacks to recordButton
         $0.onShortPressRelease = { self.camView.photoOutput.takePhoto(self.camView, flashMode: self.camView.flashMode) }
         $0.onLongPressBegan = { self.camView.startRecordingVideo() }
         $0.onLongPressRelease = { self.camView.stopRecordingVideo() }
         $0.onLongPressChanged = { addZoom in self.camView.zoomViaRecord(addZoom: addZoom) }
      }
      with(topBar) { // Attach callbacks to topBar
         $0.flipButton.onToggle = { toggle in try? self.camView.toggleCameraPosition(for: toggle ? .front : .back) }
         $0.flashButton.onToggle = { toggle in self.camView.flashMode = toggle ? .on : .off }
         $0.exitButton.onClick = { self.onCameraExit() }
      }
   }
}
