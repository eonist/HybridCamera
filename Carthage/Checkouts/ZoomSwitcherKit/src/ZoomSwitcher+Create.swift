import Foundation
import With
/*
 * - Description:
 * 1. if single camera: only make 1 button
 * 2. if dual camera: make two buttons
 * 3. if triple camera: make three buttons
 */
extension ZoomSwitcher {
   /**
    * Creates the buttons
    */
   open func createButtons(backCameraType: BackCameraType) -> [ZoomSwitcherButton] {
      return backCameraType.focalTypes.enumerated().map { i, focalType in
         with(.init(frame: ZoomSwitcherButton.rect)) {
            let title: String = "\(focalType.zoomFraction)x"
            $0.setTitle(title, for: .normal) // The zoom fraction for the text in the button
            $0.onToggle = self.onButtonToggle // Assigns callback
            $0.frame.origin = point(i: i)
            self.addSubview($0)
         }
      }
   }
}
extension ZoomSwitcher {
   /**
    * Returns position of the button
    */
   private func point(i: Int) -> CGPoint {
      let void: CGFloat = (i != 0 ? CGFloat(i) * ZoomSwitcherButton.spaceBetween : 0)
      let x: CGFloat = ZoomSwitcherButton.margin + (CGFloat(i) * ZoomSwitcherButton.buttonWidth) + void
      return .init(x: x, y: ZoomSwitcherButton.margin)
   }
}
