import Foundation
import ZoomSwitcherKit

@objc public protocol ZoomSwitcherKind: AnyObject {
   var onSwitch: ZoomSwitcher.OnSwitch { get set }
   var selectedFocalType: FocalType { get }
}
