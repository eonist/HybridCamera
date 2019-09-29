import UIKit
import AVFoundation

extension CamView {
   /**
    * Normal tap
    */
   @objc open func onPreviewViewTap(sender: UIGestureRecognizer) throws {
      guard [.ended, .cancelled, .failed].contains(sender.state) else { return } // Ensures that the tap isnt a swipe tap etc
      let devicePoint: CGPoint = (self.previewView.previewLayer).captureDevicePointConverted(fromLayerPoint: sender.location(in: sender.view))
      try deviceInput?.focusWithMode(focusMode: .continuousAutoFocus, exposureMode: .continuousAutoExposure, point: devicePoint, monitorSubjectAreaChange: true)
   }
   /**
    * Double tap -> Flip camera
    * - Fixme: ⚠️️ Do we inform flipButton and toggle ?
    */
   @objc open func onPreviewViewDoubleTap(sender: UIGestureRecognizer) throws {
      guard let device = deviceInput?.device else { return }
      try toggleCameraPosition(for: device.position == .back ? .front : .back)
   }
   /**
    * Pinch event
    * - Note: it's tempting to move this to a AVCaptureDeviceInput extension, but its called from a selector so a bit tricky
    */
   @objc open func onPreviewViewPinch(_ sender: UIPinchGestureRecognizer) {
      guard let device = self.deviceInput?.device else { Swift.print("device not available"); return }
      guard sender.state == .changed else { return }
      let pinchVelocityDividerFactor: CGFloat = 24 // the higher the number, the slower
      let desiredZoomFactor: CGFloat = device.videoZoomFactor + atan2(sender.velocity, pinchVelocityDividerFactor)
      try? deviceInput?.setZoomFactor(to: desiredZoomFactor)
      startingZoomFactorForLongPress = desiredZoomFactor
   }
}
