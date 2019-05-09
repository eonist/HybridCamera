import UIKit

@objc public protocol RecordButtonKind: AnyObject {
   var onShortPressRelease: ShortPressReleased { get set }
   var onLongPressBegan: LongPressBegan { get set }
   var onLongPressRelease: LongPressReleased { get set }
}
/**
 * Callback signatures
 */
extension RecordButtonKind {
   public typealias ShortPressReleased = () -> Void
   public typealias LongPressBegan = () -> Void
   public typealias LongPressReleased = () -> Void
   public static var defaultShortPressReleased: RecordButtonKind.ShortPressReleased { return { Swift.print("RecordButton.onShortPressRelease - no call back attached") } }
   public static var defaultLongPressBegan: RecordButtonKind.LongPressBegan { return { Swift.print("RecordButton.onLongPressBegan - no call back attached") } }
   public static var defaultLongPressReleased: RecordButtonKind.LongPressReleased { return { Swift.print("RecordButton.onLongPressRelease - no call back attached") } }
}
/**
 * RecordButtonViewKind
 */
public typealias RecordButtonViewKind = RecordButtonKind & UIView
