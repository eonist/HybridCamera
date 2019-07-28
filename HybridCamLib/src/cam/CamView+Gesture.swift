import UIKit
import With

extension CamView: UIGestureRecognizerDelegate {
   /**
    * Adds gesture event
    */
   @objc open func addGestureRecognizer() {
      // Set up tap gesture recognizers
      let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPreviewViewTap))
      let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPreviewViewDoubleTap))
      doubleTapGestureRecognizer.numberOfTapsRequired = 2
      singleTapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
      self.previewView.addGestureRecognizer(singleTapGestureRecognizer)
      self.previewView.addGestureRecognizer(doubleTapGestureRecognizer)
      //Setup pinch gesture
      with(UIPinchGestureRecognizer(target: self, action: #selector(onPreviewViewPinch))) {
         $0.delegate = self
         self.previewView.addGestureRecognizer( $0 )
      }
   }
}
