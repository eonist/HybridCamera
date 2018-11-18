import UIKit
/**
 * The purpose of this protocol is to be able to customize the HybridCamera with different UI systems
 */
@objc public protocol TopBarKind:class {
   var exitButton:ClickButtonKind {get}
   var flipButton:ToggleButtonKind {get}
   var flashButton:ToggleButtonKind {get}
}
public typealias TopBarViewKind = TopBarKind & UIView
