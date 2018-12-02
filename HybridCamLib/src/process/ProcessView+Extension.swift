import UIKit
import AVFoundation

/**
 * Create
 */
extension ProcessView{
   /**
    * Creates video view
    */
   @objc open func createVideoView() -> VideoPlayerView{
      let view = VideoPlayerView(frame: UIScreen.main.bounds)
      addSubview(view)
      return view
   }
   /**
    * Creates Image view
    */
   @objc open func createImageView() -> ImageView{
      let view = ImageView.init(frame: UIScreen.main.bounds)
      addSubview(view)
      return view
   }
   /**
    * Creates exit button
    */
   @objc open func createExitButton() -> ClickButtonKind{
      fatalError("must be overriden in subclass")
   }
   /**
    * Creates share button
    */
   @objc open func createShareButton() -> ClickButtonKind{
      fatalError("must be overriden in subclass")
   }
}
/**
 * Event
 */
extension ProcessView{
   /**
    * AttachCallBacks
    */
   @objc open func addEventListeners(){
      exitButton.onClick = {
         self.onExit()
      }
      shareButton.onClick = {/*launch share AlertDialog*/
         if let imageURL = self.imageView.url {
            self.onShare(imageURL)
         }else if let videoURL = (self.videoPlayerView.avPlayer.currentItem?.asset as? AVURLAsset)?.url {
            self.onShare(videoURL)
         }else{
            self.onShare(nil)
         }
      }
   }
   /**
    * Reset callbacks
    */
//   @objc open func clearEventListeners(){
//      exitButton.onClick = {ClickButtonKind.defaultOnClick}
//      shareButton.onClick = {ClickButtonKind.defaultOnClick}
//   }
}
/**
 * Action
 */
extension ProcessView{
   /**
    * Presents either image or video
    */
   @objc open func present(image:UIImage?,url:URL?){
      if let image = image, let url = url{
         imageView.setImage(url: url, image: image)
      } else if let url = url {
         videoPlayerView.play(videoURL: url)
      }
   }
}
/**
 * Util
 */
extension ProcessView{
   /**
    * Prompts the save file dialog
    */
   @objc open class func promptSaveFileDialog(vc:UIViewController,url:URL,onComplete:@escaping OnSaveDialogComplete){
      let activitycontroller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
      activitycontroller.excludedActivityTypes = [UIActivity.ActivityType.airDrop]
      activitycontroller.popoverPresentationController?.sourceView = vc.view
      activitycontroller.completionWithItemsHandler = { (_ type:UIActivity.ActivityType?, _ flag:Bool, _ vals:[Any]?, _ error:Error?) in onComplete() }
      vc.present(activitycontroller, animated: true, completion: nil)
   }
   /**
    * Prompts the error dilog
    */
   @objc open class func promptErrorDialog(vc:UIViewController, error:Swift.Error, onComplete:@escaping OnErrorDialogComplete){
      let alert: UIAlertController = UIAlertController(title: "Error",message: error.localizedDescription ,preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .default) { _ in onComplete()}
      alert.addAction(action)
      vc.present(alert, animated: true, completion:nil)
   }
   /**
    * deInitiate
    */
   @objc open func deInitiate(){
      videoPlayerView.deInitiate()/*Removes observer*/
      self.removeFromSuperview()/*Removes it self from the view hierarchy*/
   }
}
/**
 * Callback signatures
 */
extension ProcessView {
   public typealias OnErrorDialogComplete = () -> Void
   public typealias OnSaveDialogComplete = () -> Void
   public typealias OnShare = (_ url:URL?) -> Void
   public typealias OnExit = () -> Void
   public static let defaultOnShare:OnShare = { url in Swift.print("default onShare url:\(String(describing: url))")}
   public static let defaultOnExit:OnExit = { Swift.print("default onExit") }
}
