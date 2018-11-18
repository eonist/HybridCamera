import UIKit
import AVFoundation

extension CamView{
    /**
     * Shows the camera view finder
     */
    @objc open func createPreviewView() -> CamPreviewView{
        let previewView = CamPreviewView.init(frame: self.layer.bounds)
        self.addSubview(previewView)
        return previewView
    }
}
