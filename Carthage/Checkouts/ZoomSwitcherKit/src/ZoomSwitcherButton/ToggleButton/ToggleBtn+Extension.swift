import Foundation

extension ToggleBtn {
	/*
    * Turns of other buttons than target
    */
	static func toggleGroup(toggleButton: ToggleBtn, parent: UIView) {
//      Swift.print("toggleGroup")
      parent.subviews.filter { $0 != toggleButton }.forEach { /*Swift.print("unToggle: \($0)"); */($0 as? ToggleBtn)?.toggle = false }
		toggleButton.toggle = true
	}
}
