import UIKit

public final class HUD {
    public let image: UIImage?

    public let title: String?

    public let message: String?

    public let blurEffectStyle: UIBlurEffect.Style

    public let blocksUserInteraction: Bool

    weak var view: UIView?

    public init(
        image: UIImage? = nil,
        title: String? = nil,
        message: String? = nil,
        blurEffectStyle: UIBlurEffect.Style = .systemThinMaterial,
        blocksUserInteraction: Bool = false
    ) {
        self.image = image
        self.title = title
        self.message = message
        self.blurEffectStyle = blurEffectStyle
        self.blocksUserInteraction = blocksUserInteraction
    }
}
