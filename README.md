[![version badge](https://img.shields.io/badge/Version-1.0-blue.svg?longCache=true)](https://img.shields.io/badge/SDK-0.1-blue.svg?longCache=true) [![codebeat badge](https://codebeat.co/badges/d8d0fcdb-096c-41c0-ac20-b063051b752b)](https://codebeat.co/projects/github-com-eonist-hybridcamera-master) ![Lang](https://img.shields.io/badge/Language-Swift%204.2-orange.svg) ![platform](https://img.shields.io/badge/Platform-iOS_11.4-blue.svg)


<img width="320" alt="img" src="https://rawgit.com/stylekit/img/master/Image from iOS.jpg">

### Features
- Records video and takes photos
- Flash on/off 
- Front / Back camera
- Hold to recordVideo 
- Tap to take photo
- Tap to focus / set exposure
- Pinch to zoom
- Looping video/photo preview with share button
- Callback based (Great for RX)
- View based (Great for animation rich UI/UX)”
- Supports background music (Doesn't pause spotify etc)
- Stores photo/video in temp dir 
- Throw oriented code (allows external handling of errors)
- Persistent app authorization
- Animated record button (white to red transition)

### Why use this camera framework
- Pretty high [codebeat GPA](https://codebeat.co/projects/github-com-eonist-hybridcamera-master) 
- Few class scoped variables (In order to better handle state)
- Setup errors can be handled from the POV of the initiator
- Operation errors is handled in the onCapture completion block 
- Callback based (as oppose to delegate based)
- Easily styleable. (The camera view are separate from the UI view)
- Entirely programatic (No storyboard)
- Thoroughly documented (Artifacts and sideEffects etc)
- Uses [Linkdin style guide](https://github.com/linkedin/swift-style-guide)

### Notes:
- In order to keep things simple, The UI is CGrect based. Use your own Autolayout distro like SnapKit etc when adding additional UI

### Install
Open the .xcodeproj file and cmd + r  
To use in other projects:   
1. Copy the src folder into your project:
2. Make sure info.plist has these variables: 
 ```
Privacy - Microphone Usage Description   
Privacy - Camera Usage Description  
Privacy - Photo Library Additions Usage Description  
```