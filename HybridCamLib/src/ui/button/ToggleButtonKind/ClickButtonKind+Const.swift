import Foundation
/**
 * Call-back signatures
 */
extension ClickButtonKind {
   public static var defaultOnClick: OnClick { return { Swift.print("Default onClick()") } }
}
