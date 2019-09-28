import UIKit
/**
 * The purpose of this protocol is to be able to customize the HybridCamera with different UI systems
 * - Note: This is sort of the minimal UI needed for TopBar to work
 */
@objc public protocol TopBarKind: AnyObject {
   var exitButton: ClickButtonKind { get }
   var flipButton: ToggleButtonKind { get }
   var flashButton: ToggleButtonKind { get }
}
