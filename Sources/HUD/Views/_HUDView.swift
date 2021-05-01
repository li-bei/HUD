import UIKit

class View: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: -

class _HUDView: View {
    private let blurEffect: UIBlurEffect

    private lazy var blurEffectView: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.clipsToBounds = true
        visualEffectView.layer.cornerRadius = 9
        visualEffectView.layer.cornerCurve = .continuous
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        return visualEffectView
    }()

    private lazy var vibrancyEffectView: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        visualEffectView.contentView.layoutMargins = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        return visualEffectView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    public init(hud: HUDProtocol) {
        assert(hud.view == nil)

        blurEffect = UIBlurEffect(style: hud.blurEffectStyle)

        super.init(frame: .zero)

        isUserInteractionEnabled = hud.blocksUserInteraction
        translatesAutoresizingMaskIntoConstraints = false

        setUpSubviews()
        setUpConstraints()
        setUpStackViewArrangedSubviews(for: hud)

        hud.view = self
    }

    private func setUpSubviews() {
        addSubview(blurEffectView)
        blurEffectView.contentView.addSubview(vibrancyEffectView)
        vibrancyEffectView.contentView.addSubview(stackView)
    }

    private func setUpConstraints() {
        let blurEffectViewHeightConstraint = blurEffectView.heightAnchor.constraint(equalToConstant: 250)
        blurEffectViewHeightConstraint.priority = .defaultLow

        let margins = vibrancyEffectView.contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            blurEffectView.widthAnchor.constraint(equalToConstant: 250),
            blurEffectView.heightAnchor.constraint(greaterThanOrEqualToConstant: 250),
            blurEffectViewHeightConstraint,
            blurEffectView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blurEffectView.centerYAnchor.constraint(equalTo: centerYAnchor),

            vibrancyEffectView.leadingAnchor.constraint(equalTo: blurEffectView.contentView.leadingAnchor),
            vibrancyEffectView.trailingAnchor.constraint(equalTo: blurEffectView.contentView.trailingAnchor),
            vibrancyEffectView.topAnchor.constraint(equalTo: blurEffectView.contentView.topAnchor),
            vibrancyEffectView.bottomAnchor.constraint(equalTo: blurEffectView.contentView.bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: margins.topAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: margins.bottomAnchor),
            stackView.centerYAnchor.constraint(equalTo: vibrancyEffectView.contentView.centerYAnchor),
        ])
    }

    func setUpStackViewArrangedSubviews(for hud: HUDProtocol) {
        if let title = hud.title {
            let titlelabel = UILabel()
            titlelabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            titlelabel.numberOfLines = 0
            titlelabel.text = title
            titlelabel.textAlignment = .center
            titlelabel.textColor = .secondaryLabel
            stackView.addArrangedSubview(titlelabel)
        }
        if let message = hud.message {
            let messagelabel = UILabel()
            messagelabel.font = UIFont.preferredFont(forTextStyle: .callout).withSize(16)
            messagelabel.numberOfLines = 0
            messagelabel.text = message
            messagelabel.textAlignment = .center
            messagelabel.textColor = .secondaryLabel
            stackView.addArrangedSubview(messagelabel)
        }
    }
}
