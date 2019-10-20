import Foundation

extension ZoomSwitcher {
	public typealias OnSwitch = (_ focalType: FocalType) -> Void
	public typealias Style = (backgroundColor: UIColor, buttonStyle: ZoomSwitcherButton.Style)
}
