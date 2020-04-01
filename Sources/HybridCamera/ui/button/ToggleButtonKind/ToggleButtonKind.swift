import UIKit

@objc public protocol ToggleButtonKind: AnyObject {
   var toggle: Bool { get }
   var onToggle: OnToggle { get set }
}
