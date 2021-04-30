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
    }

    @objc
    private func showHUD() {
        let hud = HUD(
            image: UIImage(systemName: "heart"),
            title: "Loved",
            message: "This is a beautiful HUD."
        )
        view.window?.show(hud)
    }
}
