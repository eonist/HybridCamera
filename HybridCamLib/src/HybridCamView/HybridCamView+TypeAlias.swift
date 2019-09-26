import Foundation
/**
 * Typealias
 */
extension HybridCamView {
   public typealias OnCameraExit = () -> Void
   public static var defaultOnCameraExit: OnCameraExit { return { Swift.print("default onCameraExit") } }
}
