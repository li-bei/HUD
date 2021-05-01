import UIKit

public final class ActivityIndicatorHUD {
    public let title: String?

    public let message: String?

    weak var view: UIView?

    public var blurEffectStyle: UIBlurEffect.Style?

    public init(title: String? = nil, message: String? = nil, blurEffectStyle: UIBlurEffect.Style? = nil) {
        self.title = title
        self.message = message
        self.blurEffectStyle = blurEffectStyle
    }
}
