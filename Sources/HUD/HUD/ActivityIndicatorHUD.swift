import UIKit

public final class ActivityIndicatorHUD {
    public let title: String?

    public let message: String?

    weak var view: UIView?

    public var style: UIBlurEffect.Style?

    public init(title: String? = nil, message: String? = nil, style: UIBlurEffect.Style? = nil) {
        self.title = title
        self.message = message
        self.style = style
    }
}
