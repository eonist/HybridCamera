import UIKit
import HybridCamLib
import With

open class CustomCamView: HybridCamView {}
/**
 * Create
 */
extension CustomCamView {
   /**
    * Creates topbar
    * - Note: Basically overrides the default design
    */
   @objc override open func createTopBar() -> TopBarViewKind {
      return with(TopBar(frame: TopBar.rect)) {
         self.addSubview($0)
      }
   }
   /**
    * Creates Record button
    */
   @objc override open func createRecordButton() -> RecordButtonViewKind {
      return with(RecordButton(frame: RecordButton.rect)) {
         self.addSubview($0)
      }
   }
   /**
    * Creates zoom switcher
    */
   func createZoomSwitcher() -> ZoomSwitcherKind {
      return with(ZoomSwitcher(frame: ZoomSwitcher.rect)) {
         self.addSubview($0)
      }
   }
}
