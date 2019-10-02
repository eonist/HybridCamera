import Foundation
/**
 * CallBack related
 */
@objc public protocol ClickButtonKind {
   var onClick: OnClick { get set } // This button has to fulfill the callback contract of OnClick
}
