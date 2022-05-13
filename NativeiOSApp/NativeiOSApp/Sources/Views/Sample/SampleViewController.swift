import UIKit

final class SampleViewController: UIViewController {
    private lazy var greenView: UIView = {
        createDummyView(with: .green, center: CGPoint(x: 100, y: 300))
    }()

    private lazy var yellowView: UIView = {
        createDummyView(with: .yellow, center: CGPoint(x: 300, y: 300))
    }()

    private lazy var orangeView: UIView = {
        createDummyView(with: .orange, center: CGPoint(x: 200, y: 400))
    }()

    private lazy var redView: UIView = {
        createDummyView(with: .red, center: CGPoint(x: 100, y: 600))
    }()

    private lazy var blueView: UIView = {
        createDummyView(with: .blue, center: CGPoint(x: 300, y: 600))
    }()

    private let unityView = Unity.shared.view

    override func viewDidLoad() {
        super.viewDidLoad()

        let greenView = greenView
        let yellowView = yellowView
        let redView = redView
        let blueView = blueView
        let orangeView = orangeView
        let unityView = unityView

        // ネイティブUI → UaaL → ネイティブUIの描画順で行けるか検証
        view.addSubview(greenView)
        view.addSubview(yellowView)
        view.addSubview(redView)
        view.addSubview(blueView)

        // NOTE:
        // `LaunchViewController`のコメントにも記載したが、
        // AppDelegateでUaaLの初期化後に直ぐにこちらに遷移しても
        // 何故か↓の操作が有効にならないので少し間を持たせている。
        view.addSubview(unityView)
        unityView.frame = view.frame

        view.addSubview(orangeView)
    }

    private func createDummyView(with color: UIColor, center: CGPoint) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.center = center
        view.backgroundColor = color
        return view
    }
}
