import Foundation
/**
 * CallBack related
 */
extension ToggleButtonKind {
   public static var defaultOnToggle: OnToggle {
      return { toggle in Swift.print("Default onToggle: \(toggle) ") }
   }
}
