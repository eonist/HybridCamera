import UIKit

extension TopBar {
   static let rect: CGRect = {
      let size: CGSize = .init(width: UIScreen.main.bounds.size.width, height: 120)
      return .init(origin: .zero, size: size)
   }()
}
