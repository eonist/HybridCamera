import UIKit
import With

extension CamView: UIGestureRecognizerDelegate {
   /**
    * Adds gesture event
    */
   @objc open func addGestureRecognizer() {
      //set up tap gesture recognizers
      let singleTapGestureRecognizer = {
         let gesture = UITapGestureRecognizer(target: self, action: #selector(onPreviewViewTap))
         self.previewView.addGestureRecognizer(gesture)
      }
      with(UITapGestureRecognizer(target: self, action: #selector(onPreviewViewDoubleTap))) { 
         $0.numberOfTapsRequired = 2
         $0.require(toFail: $0)
         self.previewView.addGestureRecognizer($0)
      }()
      with(UIPinchGestureRecognizer(target: self, action: #selector(onPreviewViewPinch))) {
         $0.delegate = self
         self.previewView.addGestureRecognizer( $0 )
      }
      with(UILongPressGestureRecognizer(target: self, action: #selector(onPreviewViewLongPress))) {
         self.previewView.addGestureRecognizer( $0 )
      }
   }
   /**
    * Normal tap
    */
   @objc open func onPreviewViewTap(sender: UIGestureRecognizer) {
      guard [.ended, .cancelled, .failed].contains(sender.state) else { return }/*ensures that the tap isnt a swipe tap etc*/
      let devicePoint: CGPoint = (self.previewView.previewLayer).captureDevicePointConverted(fromLayerPoint: sender.location(in: sender.view))
      print("HybridCamera / CamView+Gesture / devicePoint:", devicePoint)
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
      }
   }
   
    /**
     * blurtime: Longpress and moving finger up while pressing --> zoom in
     * actuallly meant to be for recordButton
     * Why are x and y swapped??? Tried it with y but it seems like their swapped... --> are the preview and camView rotated?
     */
    @objc open func onPreviewViewLongPress(_ sender: UILongPressGestureRecognizer) {
        guard let device = self.deviceInput?.device else { Swift.print("device not available"); return }
        switch sender.state {
        case .began:
            startingX = (self.previewView.previewLayer).captureDevicePointConverted(fromLayerPoint: sender.location(in: sender.view)).x - 0.05 //blurtime: some offset so "background noise" filtered
            startingZoomFactor = device.videoZoomFactor
            break
        case .changed:
            let newX = (self.previewView.previewLayer).captureDevicePointConverted(fromLayerPoint: sender.location(in: sender.view)).x
            if newX <= startingX {
                let newZoom = startingZoomFactor * startingX / newX
                let desiredZoomFactor: CGFloat = newZoom
                setZoom(zoomFactor: desiredZoomFactor)
            }
            break
        case .failed, .ended, .cancelled:
            fallthrough
        default:
            break
        }
    }
}
