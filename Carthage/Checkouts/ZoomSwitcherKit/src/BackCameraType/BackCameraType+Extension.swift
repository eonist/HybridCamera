import UIKit
/**
 * BackCameraType - extensions
 */
extension BackCameraType {
   /**
    * Returns the needed width for the entire ZoomSwitcher
    */
   public var width: CGFloat {
      let numOfLenses: CGFloat = .init(self.numberOfLenses)
      return (numOfLenses * ZoomSwitcherButton.buttonWidth) + abs(numOfLenses - 1) * ZoomSwitcherButton.spaceBetween
   }
   /**
    * Returns a string with all focalTypes in a backCameraType
    * ## Example:
    * print(BackCameraType.triple.description) // "Ultra wide, wide angle, tele"
    */
   public var description: String {
      return focalTypes.map { "\($0.rawValue)" }.joined(separator: ", ")
      //return FocalType.allCases.map { "\($0.rawValue)" }.joined(separator: ", ")
   }
   /**
    * The various back cameras on the various iPhones
    */
   public var focalTypes: [FocalType] {
      switch self {
      case .singleWide: return [.wide] // iPhone 6, 7, 8 etc
      case .dualUltraWideAndWide: return [.ultraWide, .wide] // iPhone X
      case .dualWideAndTele: return [.wide, .tele] // iPhone 11
      case .triple: return [.ultraWide, .wide, .tele] // iPhone 11 pro
      }
   }
   /**
    * Returns the backCameraType for the device
    */
   public static var backCameraType: BackCameraType {
      //Swift.print("UIDevice.modelName:  \(UIDevice.init().modelName)")
      let device: UIDevice = .init()
      switch device.modelName {
      case .iPhone11Pro, .iPhone11ProMax:
         return .triple
      case .iPhone11:
         return .dualUltraWideAndWide
      case .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhone7Plus, .iPhone8Plus, .iPhoneXR:
         return .dualWideAndTele
      default:
         return .singleWide
      }
   }
   /**
    * Returns the amount of lenses for the backCameraType
    */
   public var numberOfLenses: Int { return focalTypes.count }
   /**
    * Tripple back cameras the default lense button is in the center, all else is to the left
    * - Note: 0.5X, 1.0x, 2.0x
    */
   public var defaultLenseIndex: Int {
      return BackCameraType.backCameraType == .triple ? 1 : 0
   }
}
