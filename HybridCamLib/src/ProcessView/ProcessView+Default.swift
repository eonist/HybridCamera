import Foundation

extension ProcessView {
   public static let defaultOnShare: OnShare = { url in Swift.print("default onShare url:\(String(describing: url))") }
   public static let defaultOnExit: OnExit = { Swift.print("default onExit") }
}
