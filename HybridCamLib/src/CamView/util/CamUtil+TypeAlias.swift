import UIKit
import AVFoundation
/**
 * Callback typealias
 */
extension CamUtil {
   /**
    * - Fixme: ⚠️️ Use Result
    */
   public typealias AssertMicAndVideoAccessComplete = (Result<Void, MicAndVideoAccessError>) -> Void
}
