import UIKit

public final class HUD {
    public let image: UIImage?

    public let title: String?

    public let message: String?

    public let blurEffectStyle: UIBlurEffect.Style

    weak var view: UIView?

    public init(
        image: UIImage? = nil,
        title: String? = nil,
        message: String? = nil,
        blurEffectStyle: UIBlurEffect.Style = .systemThinMaterial
    ) {
        self.image = image
        self.title = title
        self.message = message
        self.blurEffectStyle = blurEffectStyle
    }
}
