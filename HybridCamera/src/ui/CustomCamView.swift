import UIKit
import HybridCamLib

open class CustomCamView: HybridCamView {}
/**
 * Create
 */
extension CustomCamView {
   /**
    * Creates topbar
    * - Remark: Basically overrides the default design
    */
   @objc override open func createTopBar() -> TopBarViewKind {
      let rect: CGRect = .init(origin: .init(), size: .init(width: UIScreen.main.bounds.size.width, height: 120))
      let topBar: TopBar = .init(frame: rect)
      self.addSubview(topBar)
      return topBar
   }
   /**
    * Creates Record button
    */
   @objc override open func createRecordButton() -> RecordButtonViewKind {
      let btn = RecordButton()
      self.addSubview(btn)
      btn.setPosition()
      return btn
   }
}
