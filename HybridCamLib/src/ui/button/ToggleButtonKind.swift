import UIKit

@objc public protocol ToggleButtonKind: AnyObject {
   var toggle: Bool { get }
   var onToggle: OnToggle { get set }
}
/**
 * CallBack related
 */
extension ToggleButtonKind {
   public typealias OnToggle = (_ toggle: Bool) -> Void
   public static var defaultOnToggle: OnToggle {
       return { toggle in Swift.print("Default onToggle: \(toggle) ") }
   }
}
