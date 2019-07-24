import UIKit
import With

extension CamView: UIGestureRecognizerDelegate {
   /**
    * Adds gesture event
    */
   @objc open func addGestureRecognizer() {
      //set up tap gesture recognizers
      let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPreviewViewTap))
      let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPreviewViewDoubleTap))
      doubleTapGestureRecognizer.numberOfTapsRequired = 2
      singleTapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
    
      with(singleTapGestureRecognizer) {
         self.previewView.addGestureRecognizer( $0 )
      }
      with(doubleTapGestureRecognizer) {
         self.previewView.addGestureRecognizer( $0 )
      }
      with(UIPinchGestureRecognizer(target: self, action: #selector(onPreviewViewPinch))) {
         $0.delegate = self
         self.previewView.addGestureRecognizer( $0 )
      }
   }
   /**
    * Normal tap
    */
   @objc open func onPreviewViewTap(sender: UIGestureRecognizer) {
      guard [.ended, .cancelled, .failed].contains(sender.state) else { return }/*ensures that the tap isnt a swipe tap etc*/
      let devicePoint: CGPoint = (self.previewView.previewLayer).captureDevicePointConverted(fromLayerPoint: sender.location(in: sender.view))
      print("devicePoint: \(devicePoint)")
      self.focusWithMode(focusMode: .continuousAutoFocus, exposureMode: .continuousAutoExposure, point: devicePoint, monitorSubjectAreaChange: true)
   }
    /**
     * blurtime: Double tap --> Flip camera
     */
    @objc open func onPreviewViewDoubleTap(sender: UIGestureRecognizer) {
        setCamera(cameraType: .back) // flipButton and toggle needed here...
        print("double tap")
    }

   /**
    * - Todo: ⚠️️ move this code into action
    */
   @objc open func onPreviewViewPinch(_ sender: UIPinchGestureRecognizer) {
      guard let device = self.deviceInput?.device else { Swift.print("device not available"); return }
      if sender.state == .changed {
        let pinchVelocityDividerFactor: CGFloat = 24 /*was 5.0, which was a bit too fast*/ /*blurtime: the higher the number, the slower... previous one still too fast */
         let desiredZoomFactor: CGFloat = device.videoZoomFactor + atan2(sender.velocity, pinchVelocityDividerFactor)
         setZoom(zoomFactor: desiredZoomFactor)
         startingZoomFactorForLongPress = desiredZoomFactor
      }
   }
}
