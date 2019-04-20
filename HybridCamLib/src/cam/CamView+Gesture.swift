import UIKit
import With

extension CamView: UIGestureRecognizerDelegate {
   /**
    * Adds gesture event
    */
   @objc open func addGestureRecognizer() {
      with(UITapGestureRecognizer(target: self, action:#selector(onPreviewViewTap))){
         self.previewView.addGestureRecognizer( $0 )
      }
      with(UIPinchGestureRecognizer(target: self, action:#selector(onPreviewViewPinch))){
         $0.delegate = self
         self.previewView.addGestureRecognizer( $0 )
      }
   }
   /**
    * Normal tap
    */
   @objc open func onPreviewViewTap(sender: UIGestureRecognizer) {
      guard [.ended,.cancelled,.failed].contains(sender.state) else { return }/*ensures that the tap isnt a swipe tap etc*/
      let devicePoint:CGPoint = (self.previewView.previewLayer).captureDevicePointConverted(fromLayerPoint: sender.location(in: sender.view))
      Swift.print( devicePoint )
      self.focusWithMode(focusMode: .continuousAutoFocus, exposureMode: .continuousAutoExposure, point: devicePoint, monitorSubjectAreaChange: true)
   }
   /**
    * - Todo: ⚠️️ move this code into action
    */
   @objc open func onPreviewViewPinch(_ sender: UIPinchGestureRecognizer) {
      guard let device = self.deviceInput?.device else {Swift.print("device not available"); return }
      if sender.state == .changed {
         let pinchVelocityDividerFactor: CGFloat = 1.0/*was 5.0, which was a bit too fast*/
         let desiredZoomFactor = device.videoZoomFactor + atan2(sender.velocity, pinchVelocityDividerFactor)
         setZoom(zoomFactor: desiredZoomFactor)
      }
   }
}
