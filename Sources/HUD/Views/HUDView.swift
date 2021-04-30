import UIKit

final class HUDView: _HUDView {
    public init(hud: HUD) {
        super.init(hud: hud)
    }

    override func setUpStackViewArrangedSubviews(for hud: HUDProtocol) {
        guard let hud = hud as? HUD else {
            return
        }

        if let image = hud.image {
            stackView.addArrangedSubview(ImageView(image: image))
        }

        super.setUpStackViewArrangedSubviews(for: hud)
    }
}

// MARK: -

private final class ImageView: View {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 108)
        return imageView
    }()

    init(image: UIImage) {
        super.init(frame: .zero)
        imageView.image = image
        addSubview(imageView)
        let size = imageView.sizeThatFits(UIView.layoutFittingExpandedSize)
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height),
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
