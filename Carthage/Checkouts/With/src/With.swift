import Foundation
@discardableResult/*👈 Avoids xcode compiler warnings if result is not used*/
/**
 * ## Examples:
 * let rectangle = with(CGRect.init(x: 0, y: 0, width: 100, height: 100)) {
 *    $0 = $0.offsetBy(dx: 20, dy: 20)
 *    $0 = $0.insetBy(dx: 10, dy: 10)
 * }
 * Swift.print(rectangle)// X:30.0, y:30.0, width:80.0, height:80.0
 *
 * EXAMPLE 2:
 * let color = with(UIColor.init(red: 50, green: 100, blue: 0, alpha: 0.9)) { ( col:inout UIColor) -> Void  in
 *    col = col.withAlphaComponent(0.2)
 * }
 * Swift.print(color.cgColor.alpha)//0.2
 */
public func with<T>(_ item: T, update: (inout T) throws -> Void) rethrows -> T {
   var item = item
   try update(&item)
   return item
}
