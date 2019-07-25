import UIKit
import AVFoundation
import With
/**
 * Callback signatures
 */
extension ProcessView {
   public typealias OnErrorDialogComplete = () -> Void
   public typealias OnSaveDialogComplete = () -> Void
   public typealias OnShare = (_ url: URL?) -> Void
   public typealias OnExit = () -> Void
  
}
