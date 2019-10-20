import UIKit

open class ToggleBtn: RoundBtn, ToggleBtnKind {
   open var toggle: Bool = false
   public var onToggle: OnToggle = defaultOnToggle
}
