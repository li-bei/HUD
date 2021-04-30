import UIKit

public final class ActivityIndicatorHUD {
    public let title: String?

    public let message: String?

    weak var view: UIView?

    public init(title: String? = nil, message: String? = nil) {
        self.title = title
        self.message = message
    }
}
