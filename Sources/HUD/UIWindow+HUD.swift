import UIKit

public enum HUDHidingStrategy {
    case afterTimeInterval(TimeInterval)
    case never
}

// MARK: -

extension UIWindow {
    public func show(
        _ hud: HUD,
        animated: Bool = true,
        hidingStrategy: HUDHidingStrategy = .afterTimeInterval(2),
        blocksUserInteraction: Bool = false
    ) {
        show(
            hud as HUDProtocol,
            animated: animated,
            hidingStrategy: hidingStrategy,
            blocksUserInteraction: blocksUserInteraction
        )
    }

    public func show(
        _ hud: ActivityIndicatorHUD,
        animated: Bool = true,
        hidingStrategy: HUDHidingStrategy = .never,
        blocksUserInteraction: Bool = true
    ) {
        show(
            hud as HUDProtocol,
            animated: animated,
            hidingStrategy: hidingStrategy,
            blocksUserInteraction: blocksUserInteraction
        )
    }

    public func hide(_ hud: HUD, animated: Bool = true) {
        hide(hud as HUDProtocol, animated: animated)
    }

    public func hide(_ hud: ActivityIndicatorHUD, animated: Bool = true) {
        hide(hud as HUDProtocol, animated: animated)
    }
}

// MARK: -

extension UIWindow {
    private func show(
        _ hud: HUDProtocol,
        animated: Bool,
        hidingStrategy: HUDHidingStrategy,
        blocksUserInteraction: Bool
    ) {
        guard hud.view == nil else {
            return
        }

        let hudView = hud.makeHUDView()
        hudView.isUserInteractionEnabled = blocksUserInteraction
        addSubview(hudView)
        NSLayoutConstraint.activate([
            hudView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hudView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hudView.topAnchor.constraint(equalTo: topAnchor),
            hudView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        if animated {
            hudView.alpha = 0
            hudView.transform = .scaled
            startAnimation {
                hudView.alpha = 1
                hudView.transform = .identity
            }
        }

        switch hidingStrategy {
        case .afterTimeInterval(let timeInterval):
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) { [weak self] in
                self?.hide(hud, animated: animated)
            }
        case .never:
            break
        }
    }

    private func hide(_ hud: HUDProtocol, animated: Bool) {
        guard let hudView = hud.view else {
            return
        }

        if animated {
            startAnimation {
                hudView.alpha = 0
                hudView.transform = .scaled
            } completion: {
                hudView.removeFromSuperview()
            }
        } else {
            hudView.removeFromSuperview()
        }
    }

    private func startAnimation(_ animations: @escaping () -> Void, completion: (() -> Void)? = nil) {
        let animator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 1, animations: animations)
        if let completion = completion {
            animator.addCompletion { _ in completion() }
        }
        animator.startAnimation()
    }
}

// MARK: -

extension CGAffineTransform {
    fileprivate static var scaled: CGAffineTransform { CGAffineTransform(scaleX: 0.9, y: 0.9) }
}
