import UIKit
import AVFoundation
/**
 * Callback typealias
 */
extension CamUtil {
   /**
    * - Fixme: ⚠️️ Use Result
    */
//   public typealias AssertComplete = (_ success: Bool) -> Void
//   public typealias AssertMicAccessComplete = (Result<Void, MicAndVideoAccessError.MicAccessError>) -> Void
//   public typealias AssertVideoAccessComplete = (Result<Void, MicAndVideoAccessError.VideoAccessError>) -> Void
   public typealias AssertMicAndVideoAccessComplete = (Result<Void, MicAndVideoAccessError>) -> Void
}
