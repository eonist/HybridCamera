import UIKit
import HybridCamLib
import With
import ZoomSwitcherKit

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
//   @objc override open func createZoomSwitchBtn() -> ZoomSwitchBtnKind {
//      return with(ZoomSwitcerBtn(frame: ZoomSwitcerBtn.rect)) {
//         self.addSubview($0)
//      }
//   }
   /**
    * Creates zoom switcher
    */
   @objc override open func createZoomSwitcher() -> ZoomSwitcherKind {
      let backCamType: BackCameraType = .backCameraType
      let size = ZoomSwitcher.getSize(backCamType: backCamType)
      let rect = ZoomSwitcher.getRect(size: size) // .init(origin: .zero, size: size
      return with(ZoomSwitcher(frame: rect, backCameraType: backCamType)) { // zoomSwitcher.anchorAndSize(to: self, size: size)) {
         $0.buttons[backCamType.defaultLenseIndex].toggle = true // for tripple cam this needs to be .second,
//         $0.onSwitch = { focalType in
//            Swift.print("Switched to focalType:  \(focalType)")
//         }
         self.addSubview($0)
      }
   }
}
