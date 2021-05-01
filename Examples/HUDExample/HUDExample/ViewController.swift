import HUD
import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showHUD)
        )

        let backgroundImageView = UIImageView(image: UIImage(named: "iOS-14.2-wallpaper-LAke-The-Cliff"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    @objc
    private func showHUD() {
        let style: [UIBlurEffect.Style] = [.dark, .systemChromeMaterial, .systemMaterial, .systemMaterialLight, .systemMaterialDark]
        let hud = HUD(
            image: UIImage(systemName: "heart"),
            title: "Loved",
            message: "This is a beautiful HUD.",
            style: style.randomElement()
        )
        view.window?.show(hud)
    }
}
