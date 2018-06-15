import UIKit
import AVFoundation

/**
 * Create
 */
extension ProcessMediaView{
    /**
     * Creates video view
     */
    func createVideoView() -> VideoPlayerView{
        let view = VideoPlayerView(frame: UIScreen.main.bounds)
        addSubview(view)
        return view
    }
    /**
     * Creates Image view
     */
    func createImageView() -> ImageView{
        let view = ImageView.init(frame: UIScreen.main.bounds)
        addSubview(view)
        return view
    }
    /**
     * Creates exit button
     */
    func createExitButton() -> ExitButton{
        let btn = ExitButton()
        self.addSubview(btn)
        return btn
    }
    /**
     * Creates share button
     */
    func createShareButton() -> ShareButton{
        let s = CGSize.init(width: 180, height: 40)
        let margin:CGFloat = 40
        let p = CGPoint.init(x: UIScreen.main.bounds.width/2 - s.width/2, y: UIScreen.main.bounds.height - margin - s.height)
        let btn = ShareButton.init(frame: CGRect.init(origin: p, size: s))
        self.addSubview(btn)
        return btn
    }
}
/**
 * Event
 */
extension ProcessMediaView{
    /**
     * AttachCallBacks
     */
    func attachCallBacks(){
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
}
/**
 * Action
 */
extension ProcessMediaView{
    /**
     * Presents either image or video
     */
    func present(image:UIImage?,url:URL?){
        if let image = image, let url = url{
            imageView.setImage(url: url, image: image)
        }else if let url = url {
            videoPlayerView.play(videoURL: url)
        }
    }
}
/**
 * Util
 */
extension ProcessMediaView{
    /**
     * Prompts the save file dialog
     */
    static func promptSaveFile(vc:UIViewController,url:URL,onComplete:@escaping ()->Void){
        let activitycontroller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        activitycontroller.excludedActivityTypes = [UIActivityType.airDrop]
        activitycontroller.popoverPresentationController?.sourceView = vc.view
        activitycontroller.completionWithItemsHandler = { (_ type:UIActivityType?, _ flag:Bool, _ vals:[Any]?, _ error:Error?) in onComplete() }
        vc.present(activitycontroller, animated: true, completion: nil)
    }
    /**
     * Prompts the error dilog
     */
    static func promptErrorDialog(vc:UIViewController,error:Swift.Error,onComplete:@escaping ()->Void){
        let alert: UIAlertController = UIAlertController(title: "Error",message: error.localizedDescription ,preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in onComplete()}
        alert.addAction(action)
        vc.present(alert, animated: true, completion:nil)
    }
}
