import UIKit

@objc public protocol ToggleBtnKind: AnyObject {
   var toggle: Bool { get set }
   var onToggle: OnToggle { get set }
}
