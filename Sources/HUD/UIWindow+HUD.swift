import UIKit

extension UIWindow {
    public func show(_ hud: HUD, animated: Bool = true, hideAfter timeInterval: TimeInterval = 2) {
        guard hud.view == nil else {
            return
        }

        let hudView = HUDView(hud: hud)
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

        if timeInterval > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) { [weak self] in
                self?.hide(hud, animated: animated)
            }
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
