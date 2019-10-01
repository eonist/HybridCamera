import Foundation
import HybridCamLib

extension ViewController {
   /**
    * Default callback for error dialog
    */
   var defaultOnErrorDialogComplete: ProcessView.OnErrorDialogComplete { // add throwing
      return {
         self.processMediaView?.deInitiate()
         self.processMediaView = nil
         try? self.resetZoom()
         try? self.switchAudioSession(to: .playAndRecord)
      }
   }
   /**
    * Default callback for photo capture
    */
   var defaultPhotoCaptureCompleted: CamView.PhotoCaptureCompleted {
      return { [weak self] in
         guard let self = self else { Swift.print("🚫"); return }
         if case .success(let value) = $0 {
            self.onCapture(result: .success((value.image, value.url)))
         } else if case .failure(let error) = $0 {
            self.onCapture(result: .failure(error))
         }
      }
   }
   /**
    * Default callback for video capture
    */
   var defaultVideoCaptureCompleted: CamView.VideoCaptureCompleted {
      return { [weak self] in
         if case .success(let value) = $0 {
            self?.onCapture(result: .success((nil, value)))
         } else if case .failure(let error) = $0 {
            self?.onCapture(result: .failure(error))
         }
      }
   }
   /**
    * Default behaviour for onExit call
    */
   var defaultOnExit: ProcessView.OnExit {
      return { [weak self] in
         self?.processMediaView?.deInitiate()
         self?.processMediaView = nil
         try? self?.switchAudioSession(to: .playAndRecord)
      }
   }
   var defaultOnShare: ProcessView.OnShare {
      return { [weak self] url in
         guard let self = self else { return }
         guard let url = url else { return }
         CustomProcessView.promptSaveFileDialog(vc: self, url: url) {
            self.processMediaView?.deInitiate()
         }
      }
   }
}
