# ResultSugar
Sugar for Result


### Install:

- Carthage `github "eonist/SomeFramework"`
- Manual Open `SomeFrameworkExample.xcodeproj`
- CocoaPod (Coming soon)


### Examples:

```swift
guard let imageAndURL: (UIImage, URL) = $0.value else { return }
imageAndURL.image // UIImage
imageAndURL.url // URL
print($0.errorStr)
```
