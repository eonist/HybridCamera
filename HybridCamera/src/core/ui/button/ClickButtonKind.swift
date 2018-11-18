import Foundation
/**
 * CallBack related
 */
@objc public protocol ClickButtonKind {}
extension ClickButtonKind {
   public typealias OnClick = () -> Void
   public static var defaultOnClick:OnClick { return {Swift.print("Default onClick()")}}
}
