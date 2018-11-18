import UIKit
/**
 * The purpose of this protocol is to be able to customize the HybridCamera with different UI systems
 */
@objc public protocol TopBarKind:class {
   var exitButton:ExitButton {get}
   var flipButton:FlipButton {get}
   var flashButton:FlashButton {get}
}
public typealias TopBarViewKind = TopBarKind & UIView
