import UIKit

final class ActivityIndicatorHUDView: _HUDView {
    init(hud: ActivityIndicatorHUD) {
        super.init(hud: hud)
    }

    override func setUpStackViewArrangedSubviews(for hud: HUDProtocol) {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.startAnimating()
        stackView.addArrangedSubview(activityIndicatorView)

        super.setUpStackViewArrangedSubviews(for: hud)
    }
}
