import Foundation
/**
 * Event
 */
extension ZoomSwitcher {
	/**
    * When user taps any of the togglebuttons (makes it active and the others inactive)
    */
   @objc open func onButtonToggle(_ sender: ToggleBtnKind, _ toggle: Bool) {
//      Swift.print("onButtonToggle")
      guard let toggleButton = sender as? ToggleBtn else { return }
		ToggleBtn.toggleGroup(toggleButton: toggleButton, parent: self)
      let focalTypes = self.backCameraType.focalTypes
      guard let idx: Int = self.subviews.firstIndex(of: toggleButton) else { fatalError("Index not found") }
      let focalType = focalTypes[idx]
      onSwitch(focalType)
	}
}
