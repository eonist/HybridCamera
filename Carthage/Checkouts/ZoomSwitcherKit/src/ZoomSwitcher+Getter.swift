import Foundation
/**
 * Getter
 */
extension ZoomSwitcher {
   /**
    * Returns size of zoomswitcher
    */
   public static func getSize(backCamType: BackCameraType) -> CGSize {
      let width = backCamType.width + ZoomSwitcherButton.margin + ZoomSwitcherButton.margin
      let height = ZoomSwitcherButton.buttonWidth + ZoomSwitcherButton.margin + ZoomSwitcherButton.margin
      return .init(width: width, height: height)
   }
   /**
    * Returns selected focaltype
    */
   @objc public var selectedFocalType: FocalType {
      guard let index: Int = self.buttons.firstIndex(where: { $0.toggle }) else { fatalError("not supported") }
      return backCameraType.focalTypes[index]
   }
}
