import Foundation
/**
 * CallBack related
 */
@objc public protocol ClickButtonKind {
   var onClick:OnClick {get set}
}
/**
 * Call-back signatures
 */
extension ClickButtonKind {
   public typealias OnClick = () -> Void
   public static var defaultOnClick:OnClick { return {Swift.print("Default onClick()")}}
}
