import Foundation
/**
 * - Parameters:
 *   - ultrawide: The new iphone 11 (almost fish eye)
 *   - wide: all iphones since iphone 3G (regular focal length)
 *   - tele: available from iphone 7 plus (medium distance zoom)
 */
@objc public enum FocalType: Int, CaseIterable { case ultraWide = 0, wide, tele }
