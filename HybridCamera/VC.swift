import UIKit
/**
 * Main view controller
 */
class VC:UIViewController{
    /**
     * We add the Camera view in the viewDidAppear so that its tricggered again after user changes the app prefs to allow video use
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CamUtil.assertVideoAndMicAccess(vc: self){ (success:Bool) in
            guard success else {return}
            DispatchQueue.main.async {
                self.initiate()
            }
        }
    }
    override var shouldAutorotate: Bool  {return false}/*Locks autorotate*/
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}
/**
 * Extension
 */
extension VC{
    /**
     * Common init
     */
    func initiate(){
        let hybridCamView = HybridCamView()
        self.view = hybridCamView
        hybridCamView.camView.onPhotoCaptureComplete = onCapture
        hybridCamView.camView.onVideoCaptureComplete = {(url:URL?,error:Error?)in self.onCapture(nil,url,error)}
    }
    /**
     * When camera onCapture is called
     */
    private func onCapture(_ image:UIImage?,_ url:URL?,_ error:Error?) {
        let processMediaView = ProcessMediaView.init(frame: UIScreen.main.bounds)
        processMediaView.onExit = {processMediaView.deInitiate()}
        processMediaView.onShare = { (url:URL?) in if let url = url {ProcessMediaView.promptSaveFile(vc: self, url: url, onComplete: {processMediaView.deInitiate()})}}
        self.view.addSubview(processMediaView)
        if let error = error{
            ProcessMediaView.promptErrorDialog(vc: self, error: error, onComplete: {processMediaView.deInitiate()});return
        }else {
            processMediaView.present(image: image, url: url)
        }
    }
}
