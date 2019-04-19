# With 💗
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![codebeat badge](https://codebeat.co/badges/51c98d04-a860-42ff-ba93-dd89184ec302)](https://codebeat.co/projects/github-com-eonist-with-master)

### What is it:
An extension that let's you manipulate an object with a closure

### How does it work:
See [Example](https://github.com/eonist/With#example)

### How can I get it:
- Carthage: `github "eonist/With" "master"`
- Cocoapods: `Coming soon`
- Manual installation: Open `.xcodeproj`

### Example:

```swift
//EXAMPLE 1:
let rectangle = with(CGRect.init(x: 0, y: 0, width: 100, height: 100)) {
  $0 = $0.offsetBy(dx: 20, dy: 20)
  $0 = $0.insetBy(dx: 10, dy: 10)
}
Swift.print(rectangle)// X:30.0, y:30.0, width:80.0, height:80.0

//EXAMPLE 2:
let color:UIColor = with(.init(red: 50, green: 100, blue: 0, alpha: 0.9)) { ( col:inout UIColor) -> Void  in
  col = col.withAlphaComponent(0.2)
}
Swift.print(color.cgColor.alpha)//0.2

//EXAMPLE 3:
var size:CGSize = CGSize(width:50,height:40)
with(size) {
  $0.width = 100
  $0.height = 50
}
Swift.print(size)//100,50

//EXAMPLE 4:
func createImageView() -> UIImageView{
   return with(.init()){
      $0.image = UIImage(named:"someGraphic")
      self.addSubview($0)
   }
}
createImage()//Adds image to view
```

### Credit:

Thanks [https://github.com/sindresorhus](https://github.com/sindresorhus) for teaching me this JavaScript-esque super power 💪
