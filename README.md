[![version badge](https://img.shields.io/badge/Version-1.0-blue.svg?longCache=true)](https://img.shields.io/badge/SDK-0.1-blue.svg?longCache=true)
![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg) 
![platform](https://img.shields.io/badge/Platform-iOS_12.0-blue.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![codebeat badge](https://codebeat.co/badges/d8d0fcdb-096c-41c0-ac20-b063051b752b)](https://codebeat.co/projects/github-com-eonist-hybridcamera-master)
[![Build Status](https://travis-ci.com/eonist/HybridCamera.svg?branch=master)](https://travis-ci.com/eonist/HybridCamera)
[![](https://img.shields.io/badge/Protected_by-Hound-a873d1.svg)](https://houndci.com)

<img width="192" alt="img" src="https://rawgit.com/stylekit/img/master/vid_edited_2_2mb.gif">

### Features:

| Description  |  |
| ------------- | ------------- |
| Records video  | 🎥  |
| takes photos  | 📷  |
| Flash on/off  | ⚡  |
| Front / Back camera | ↕️  |
| Hold to record video | ✊ |
| Tap to take photo |  👇 |
| Tap to focus / set exposure  | 🔎  |
| Pinch to zoom  | 👌  |
| Looping video/photo preview  | 🔁  |
| Share button  | 🔗  |
| Programatic UI  | 🤖  |
| Doesn't stop Spotify | 🎶  |
| Stores files in temporary | 💾   |
| Throw oriented code  | 💣 |
| Persistent app authorisation  | 🚫  |
| Animated record button  | 🔴 |
| [Callback based](https://medium.cobeisfresh.com/why-you-shouldn-t-use-delegates-in-swift-7ef808a7f16b)  | 📞 |



### Why use this camera framework
- High [codebeat GPA](https://codebeat.co/projects/github-com-eonist-hybridcamera-master)
- Low class scoped variable count (In order to better handle overall state)
- Setup errors can be handled from the POV of the initiator
- Operation errors is handled in the onCapture completion block
- Callback based (as oppose to delegate based) [More info](https://medium.cobeisfresh.com/why-you-shouldn-t-use-delegates-in-swift-7ef808a7f16b)
- Easily styleable (The camera view is separate from the UI view)
- No third-party libraries or Sugar
- Entirely programatic (No storyboard)
- Thoroughly documented (Artifacts and sideEffects etc)
- Uses [Sindre-lint style guide](https://github.com/sindresorhus/swiftlint-sindre)
- Small footprint, only ~750 LOC (Lines of code)
### Notes:
- In order to keep things simple, The UI is CGRect based. Use your own Autolayout distro like SnapKit etc when adding additional UI

### Install:
- Carthage: `github "eonist/HybridCamera" "master"`
- Manual: Open `HybridCamera.xcodeproj`
- CocoaPod (Coming soon)  

**IMPORTANT:** Make sure info.plist has these variables  
 ```
Privacy - Microphone Usage Description   
Privacy - Camera Usage Description  
Privacy - Photo Library Additions Usage Description  
```

### Example:
<img width="320" alt="img" src="https://rawgit.com/stylekit/img/master/Image from iOS.jpg">


### Example code:   
```swift
self.view = HybridCamView()
view.camView.onPhotoCaptureComplete = { (image: UIImage?, url: URL?, error: Error?) in
   Swift.print("On photo capture complete \(url)")
}
hybridCamView.camView.onVideoCaptureComplete = { (url: URL?, error: Error?) in
   Swift.print("On Video capture complete \(url)")
}
```
### Todo:
- Add support for more orientation modes (Currently only supports portrait)
- Add support for error resolution from the POV of initiating the camera
- Make UI with AutoLayout 👈
- Make lib carthage support ✅
- Fix AudioBug ✅
- Fix FontCamera bug w/ IphoneX ✅
- Add Spatial, Chaplin as an option to HybridCam 👈
- Add CI-Travis 👈

### Contributors:
- [eonist](https://gitHub.com/eonist)  
- [blurtime](https://gitHub.com/blurtime)
