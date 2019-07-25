import UIKit
import AVFoundation
import With
/**
 * Create
 */
extension ProcessView {
   /**
    * Creates video view
    */
   @objc open func createVideoView() -> VideoPlayerView {
      return with(.init(frame: UIScreen.main.bounds)) {
         addSubview($0)
      }
   }
   /**
    * Creates Image view
    */
   @objc open func createImageView() -> ImageView {
      return with(.init(frame: UIScreen.main.bounds)) {
         addSubview($0)
      }
   }
   /**
    * Creates exit button
    */
   @objc open func createExitButton() -> ClickButtonKind {
      fatalError("must be overriden in subclass")
   }
   /**
    * Creates share button
    */
   @objc open func createShareButton() -> ClickButtonKind {
      fatalError("must be overriden in subclass")
   }
}
