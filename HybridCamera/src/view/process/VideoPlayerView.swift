import UIKit
import AVFoundation

class VideoPlayerView:UIView{
    let avPlayer = AVPlayer()
    lazy var avPlayerLayer: AVPlayerLayer = createAvPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _ = avPlayerLayer
        NotificationCenter.default.addObserver(self, selector: #selector(finishVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension VideoPlayerView{
    /**
     * Play video
     */
    func play(videoURL:URL){
        let playerItem = AVPlayerItem(url: videoURL as URL)
        avPlayer.replaceCurrentItem(with: playerItem)
        avPlayer.play()
    }
    @objc func finishVideo(){
        avPlayer.seek(to: kCMTimeZero)
        avPlayer.play()
    }
    /**
     * Setting object to nil makes the observer work on the 
     */
    func deInitiate(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    /**
     * New
     */
    func createAvPlayerLayer() -> AVPlayerLayer{
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.frame = frame
        avPlayerLayer.videoGravity = .resizeAspectFill
        self.layer.insertSublayer(avPlayerLayer, at: 0)
        return avPlayerLayer
    }
}
