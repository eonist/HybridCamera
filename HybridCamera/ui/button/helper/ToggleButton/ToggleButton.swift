import UIKit

open class ToggleButton: RoundButton, ToggleButtonKind {
   open var toggle: Bool = false
   public var onToggle: OnToggle = defaultOnToggle
}
