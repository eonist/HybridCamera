import Foundation
/**
 * Const
 */
extension ZoomSwitcher {
   public static var defaultOnSwitch: OnSwitch = { focalType in print("FocalType: \(focalType)") }
   public static let style: Style = (backgroundColor: .darkGray, buttonStyle: ZoomSwitcherButton.off)
}
