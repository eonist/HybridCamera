import Foundation
/**
 * - Note: You can now do: .success instead of .success(()) When using Result<Void, MicAndVideoAccessError>
 * - Note: ref this discussion: https://stackoverflow.com/questions/45837915/generic-swift-4-enum-with-void-associated-type
 */
extension Result where Success == Void {
   public static var success: Result {
      return .success(())
   }
}
/**
 * - Note: Sometimes you just want to do print($0.error)
 */
extension Result {
   public var error: String {
      if case .failure(let error) = self {
         return error.localizedDescription
      } else {
         return "success"
      }
   }
}
