import UIKit

public final class ActivityIndicatorHUD {
    public let title: String?

    public let message: String?

    public let blurEffectStyle: UIBlurEffect.Style

    public let blocksUserInteraction: Bool

    weak var view: UIView?

    public init(
        title: String? = nil,
        message: String? = nil,
        blurEffectStyle: UIBlurEffect.Style = .systemThinMaterial,
        blocksUserInteraction: Bool = true
    ) {
        self.title = title
        self.message = message
        self.blurEffectStyle = blurEffectStyle
        self.blocksUserInteraction = blocksUserInteraction
    }
}
