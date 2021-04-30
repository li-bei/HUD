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
        guard hud.view == nil else {
            return
        }

        let hudView = HUDView(hud: hud)
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

    public func hide(_ hud: HUD, animated: Bool = true) {
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
