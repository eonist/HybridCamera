import UIKit
import AVFoundation

extension CamView {
   /**
    * Normal tap
    */
   @objc open func onPreviewViewTap(sender: UIGestureRecognizer) {
      guard [.ended, .cancelled, .failed].contains(sender.state) else { return } // Ensures that the tap isnt a swipe tap etc
      let devicePoint: CGPoint = (self.previewView.previewLayer).captureDevicePointConverted(fromLayerPoint: sender.location(in: sender.view))
      self.focusWithMode(focusMode: .continuousAutoFocus, exposureMode: .continuousAutoExposure, point: devicePoint, monitorSubjectAreaChange: true)
   }
   /**
    * Double tap -> Flip camera
    * - Fixme: ⚠️️ Do we inform flipButton and toggle ?
    */
   @objc open func onPreviewViewDoubleTap(sender: UIGestureRecognizer) {
      guard let device = deviceInput?.device else { return }
      toggleCamera(for: device.position == .back ? .front : .back)
   }
   /**
    * Pinch event
    */
   @objc open func onPreviewViewPinch(_ sender: UIPinchGestureRecognizer) {
      guard let device = self.deviceInput?.device else { Swift.print("device not available"); return }
      if sender.state == .changed {
         let pinchVelocityDividerFactor: CGFloat = 24 // the higher the number, the slower
         let desiredZoomFactor: CGFloat = device.videoZoomFactor + atan2(sender.velocity, pinchVelocityDividerFactor)
         setZoomFactor(to: desiredZoomFactor)
         startingZoomFactorForLongPress = desiredZoomFactor
      }
   }
}
