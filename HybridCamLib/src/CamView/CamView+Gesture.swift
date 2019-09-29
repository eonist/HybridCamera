import UIKit
import With

extension CamView: UIGestureRecognizerDelegate {
   /**
    * Adds gesture event
    */
   @objc open func addGestureRecognizer() {
      setupTapGestureRecognizers()
      setupPinchGesture()
   }
}
extension CamView {
   /**
    * setupTapGestureRecognizers
    */
   private func setupTapGestureRecognizers() {
      let singleTap = UITapGestureRecognizer(target: self, action: #selector(onPreviewViewTap))
      let doubleTap = UITapGestureRecognizer(target: self, action: #selector(onPreviewViewDoubleTap))
      doubleTap.numberOfTapsRequired = 2
      singleTap.require(toFail: doubleTap)
      self.previewView.addGestureRecognizer(singleTap)
      self.previewView.addGestureRecognizer(doubleTap)
   }
   /**
    * setupPinchGesture
    */
   private func setupPinchGesture() {
      with(UIPinchGestureRecognizer(target: self, action: #selector(onPreviewViewPinch))) {
         $0.delegate = self
         self.previewView.addGestureRecognizer( $0 )
      }
   }
}
