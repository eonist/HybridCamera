import UIKit
import AVFoundation

extension CamView{
    /**
     * Shows the camera view finder
     */
    func createPreviewView() -> CamPreviewView{
        let previewView = CamPreviewView.init(frame: self.layer.bounds)
        self.addSubview(previewView)
        return previewView
    }
}
