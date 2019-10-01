import UIKit
import HybridCamLib
import With
import AVFoundation

extension ViewController {
   /**
    * Creates ProcessView
    */
   func createProcessView() -> CustomProcessView {
      return with(.init(frame: UIScreen.main.bounds)) {
         $0.onExit = defaultOnExit
         $0.onShare = defaultOnShare
         self.view.addSubview($0)
         try? self.resetZoom()
         try? self.switchAudioSession(to: .playback)
      }
   }
}
