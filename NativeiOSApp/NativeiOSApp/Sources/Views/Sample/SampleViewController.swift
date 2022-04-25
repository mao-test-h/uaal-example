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

        view.addSubview(greenView)
        view.addSubview(yellowView)
        view.addSubview(redView)
        view.addSubview(blueView)

        view.addSubview(unityView)
        NSLayoutConstraint.activate([
            unityView.topAnchor.constraint(equalTo: view.topAnchor),
            unityView.leftAnchor.constraint(equalTo: view.leftAnchor),
            unityView.rightAnchor.constraint(equalTo: view.rightAnchor),
            unityView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        view.addSubview(orangeView)
    }

    override func loadView() {
        super.loadView()
    }

    private func createDummyView(with color: UIColor, center: CGPoint) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.center = center
        view.backgroundColor = color
        return view
    }
}
