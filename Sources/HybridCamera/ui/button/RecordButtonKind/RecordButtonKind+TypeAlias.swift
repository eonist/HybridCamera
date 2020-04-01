import QuartzCore
/**
 * Callback signatures
 */
extension RecordButtonKind {
   public typealias ShortPressReleased = () -> Void
   public typealias LongPressBegan = () -> Void
   public typealias LongPressReleased = () -> Void
   public typealias LongPressChanged = (CGFloat) -> Void
}
