import UIKit

public final class ActivityIndicatorHUD {
    public let title: String?

    public let message: String?

    public let blurEffectStyle: UIBlurEffect.Style

    weak var view: UIView?

    public init(
        title: String? = nil,
        message: String? = nil,
        blurEffectStyle: UIBlurEffect.Style = .systemThinMaterial
    ) {
        self.title = title
        self.message = message
        self.blurEffectStyle = blurEffectStyle
    }
}
