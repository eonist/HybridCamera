import Foundation
import With
/**
 * Events
 */
extension HybridCamView {
   /**
    * Attach CallBacks
    * - Fixme: ⚠️️ add support for .auto flashmode?
    */
   @objc public func addEventHandlers() {
      with(recordButton) { // Attach callbacks to recordButton
         $0.onShortPressRelease = { self.camView.photoOutput.takePhoto(self.camView, flashMode: self.camView.flashMode) }
         $0.onLongPressBegan = { self.camView.startRecordingVideo() }
         $0.onLongPressRelease = { self.camView.stopRecordingVideo() }
         $0.onLongPressChanged = { self.camView.zoomViaRecord(addZoom: $0) }
      }
      with(topBar) { // Attach callbacks to topBar
         $0.flipButton.onToggle = { try? self.camView.toggleCameraPosition(for: $0 ? .front : .back) }
         $0.flashButton.onToggle = { self.camView.flashMode = $0 ? .on : .off }
         $0.exitButton.onClick = { self.onCameraExit() }
      }
      zoomSwitcher.onToggle = { try? self.camView.toggleCameraPosition(for: self.topBar.flipButton.toggle ? .front : .back, deviceType: $0 ? .builtInWideAngleCamera : .builtInTelephotoCamera) }
   }
}
