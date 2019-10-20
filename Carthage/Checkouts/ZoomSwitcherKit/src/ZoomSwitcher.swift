import Foundation
/**
 * ZoomSwitcher
 */
open class ZoomSwitcher: UIView {
   public let backCameraType: BackCameraType
   @objc public var onSwitch: OnSwitch
   public lazy var buttons: [ZoomSwitcherButton] = createButtons(backCameraType: backCameraType)
   /**
    * ## Examples:
    * let size = ZoomSwitcher.getSize(backCamType: .backCameraType)
    * let zoomSwitcher: ZoomSwitcher = .init(frame: .init(origin: .zero, size: size), backCameraType: .backCameraType)
    * addSubview(zoomSwitcher)
    * zoomSwitcher.anchorAndSize(to: self, size: size)
    */
   public init(frame: CGRect, backCameraType: BackCameraType, onSwitch: @escaping OnSwitch = defaultOnSwitch) {
      self.backCameraType = backCameraType
      self.onSwitch = onSwitch
      super.init(frame: frame)
      styleBackground()
      _ = buttons
   }
   /**
    * Boilerplate
    */
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
