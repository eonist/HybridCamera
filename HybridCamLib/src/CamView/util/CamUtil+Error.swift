import Foundation
/**
 * Errors
 */
extension CamUtil {
   public enum MicAndVideoAccessError: Error {
      case micAuthorized, micDeniedOrRestricted, micAccessNotDetermined, videoAccessWasDenied
   }
}
