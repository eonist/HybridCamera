import Foundation
/**
 * Typealias
 */
extension HybridCamView {
   public typealias OnCameraExit = () -> Void
   // rename to defaultCameraExitHandler
   public static var defaultOnCameraExit: OnCameraExit { return { Swift.print("default onCameraExit") } }
}
