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
extension Result {
   /**
    * - Note: Sometimes you just want to do print($0.errorStr)
    */
   public var errorStr: String {
      guard let error: Error = self.error() else { return "success" }
      return error.localizedDescription
   }
   /**
    * - Note: Sometimes you just want to do print($0.error)
    */
//   public var error: Error? {
//      guard case .failure(let error) = self else { return nil }
//      return error
//   }
   public func error<T>() -> T? where T: Error {
      guard case .failure(let error) = self else { return nil }
      return error as? T
   }
   /**
    * ## Examples
    * guard let imageAndURL: (UIImage, URL) = $0.value else { return }
    * imageAndURL.image // UIImage
    * imageAndURL.url // URL
    */
   public func value<T>() -> T? {
      return try? self.get() as? T
   }
}
