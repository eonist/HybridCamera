import Foundation

extension RecordButtonKind {
   public static var defaultShortPressReleased: RecordButtonKind.ShortPressReleased { return { Swift.print("RecordButton.onShortPressRelease - no call back attached") } }
   public static var defaultLongPressBegan: RecordButtonKind.LongPressBegan { return { Swift.print("RecordButton.onLongPressBegan - no call back attached") } }
   public static var defaultLongPressReleased: RecordButtonKind.LongPressReleased { return { Swift.print("RecordButton.onLongPressRelease - no call back attached") } }
   public static var defaultLongPressChanged: RecordButtonKind.LongPressChanged { return { _ in Swift.print("RecordButton.onLongPressChanged - no call back attached") } }
}
