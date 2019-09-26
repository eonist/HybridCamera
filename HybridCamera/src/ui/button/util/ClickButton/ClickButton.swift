import UIKit
import HybridCamLib

open class ClickButton: RoundButton, ClickButtonKind {
   public var onClick: OnClick = defaultOnClick
}
