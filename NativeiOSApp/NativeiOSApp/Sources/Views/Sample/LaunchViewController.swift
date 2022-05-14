import UIKit

// UaaLが立ち上がるまでに表示するダミー画面 (ロード中である事を分かりやすくするために赤く塗っている)
final class LaunchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
