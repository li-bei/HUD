import UIKit

public final class HUD {
    public let image: UIImage?

    public let title: String?

    public let message: String?

    weak var view: UIView?

    public var blurEffectStyle: UIBlurEffect.Style?

    public init(image: UIImage? = nil, title: String? = nil, message: String? = nil, blurEffectStyle: UIBlurEffect.Style? = nil) {
        self.image = image
        self.title = title
        self.message = message
        self.blurEffectStyle = blurEffectStyle
    }
}
