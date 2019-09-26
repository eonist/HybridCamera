import UIKit

/**
 * RecordButtonViewKind
 */
@objc public protocol RecordButtonKind: AnyObject {
   var onShortPressRelease: ShortPressReleased { get set }
   var onLongPressBegan: LongPressBegan { get set }
   var onLongPressRelease: LongPressReleased { get set }
   var onLongPressChanged: LongPressChanged { get set }
}
