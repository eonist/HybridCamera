import Foundation
import With
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
   /**
    * Creates zoom switcher
    */
//   @objc open func createZoomSwitchBtn() -> ZoomSwitchBtnKind {
//      fatalError("must be overriden in subclass")
//   }
   /**
    * Creates zoom switcher
    */
   @objc open func createZoomSwitcher() -> ZoomSwitcherKind {
      fatalError("must be overriden in subclass")
   }
}
