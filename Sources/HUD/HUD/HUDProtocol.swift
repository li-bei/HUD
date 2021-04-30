import UIKit

protocol HUDProtocol: AnyObject {
    var title: String? { get }

    var message: String? { get }

    var view: UIView? { get set }

    func makeHUDView() -> UIView
}

// MARK: -

extension HUD: HUDProtocol {
    func makeHUDView() -> UIView {
        HUDView(hud: self)
    }
}

// MARK: -

extension ActivityIndicatorHUD: HUDProtocol {
    func makeHUDView() -> UIView {
        ActivityIndicatorHUDView(hud: self)
    }
}
