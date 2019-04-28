import UIKit
import AVFoundation
import With

extension CamView {
   /**
    * Shows the camera view finder
    */
   @objc open func createPreviewView() -> CamPreviewView {
      return with( .init(frame: self.layer.bounds) ) {
         self.addSubview($0)
      }
   }
}
