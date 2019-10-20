import UIKit
import ZoomSwitcherKit

class View: UIView {
   lazy var zoomSwitcher: ZoomSwitcher = createZoomSwitcher()
   override init(frame: CGRect) {
      super.init(frame: frame)
      Swift.print("View.init()")
      _ = zoomSwitcher
//      let size = ZoomSwitcher.getSize(backCamType: .backCameraType)
//      Swift.print("size:  \(size)")
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension View {
   /**
    * Creates ZoomSwitcher
    */
   func createZoomSwitcher() -> ZoomSwitcher {
      let backCamType: BackCameraType = .backCameraType
      let size = ZoomSwitcher.getSize(backCamType: backCamType)
      let zoomSwitcher: ZoomSwitcher = .init(frame: .init(origin: .zero, size: size), backCameraType: backCamType) // zoomSwitcher.anchorAndSize(to: self, size: size)
      zoomSwitcher.buttons[backCamType.defaultLenseIndex].toggle = true // for tripple cam this needs to be .second,
      addSubview(zoomSwitcher)
      zoomSwitcher.onSwitch = { focalType in
         Swift.print("Switched to focalType:  \(focalType)")
      }
      return zoomSwitcher
   }
}
