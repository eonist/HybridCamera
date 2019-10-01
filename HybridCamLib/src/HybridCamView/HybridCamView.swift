import UIKit
/**
 * Main view of HybridCam
 * - Note: To support merging video segments: https://www.raywenderlich.com/188034/how-to-play-record-and-merge-videos-in-ios-and-swift
 * - Note: To support overlays on videos: https://www.lynda.com/Swift-tutorials/AVFoundation-Essentials-iOS-Swift/504183-2.html
 */
open class HybridCamView: UIView {
   public lazy var camView: CamView = createCamView()
   public lazy var topBar: TopBarViewKind = createTopBar()
   public lazy var recordButton: RecordButtonViewKind = createRecordButton()
   public var onCameraExit: OnCameraExit = defaultOnCameraExit
   /**
    * Adds UI, eventHandlers and then starts the Camera preview view
    */
   override public init(frame: CGRect) {
      super.init(frame: frame)
      _ = camView
      _ = topBar
      _ = recordButton
      addEventHandlers()
      camView.startPreview() // Starts preview session
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
