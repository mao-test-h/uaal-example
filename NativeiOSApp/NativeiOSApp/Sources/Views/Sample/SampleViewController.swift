import UIKit

class SampleViewController: UIViewController {
    private let unityView = Unity.shared.view

    override func loadView() {
        super.loadView()
        view.addSubview(unityView)
        NSLayoutConstraint.activate([
            unityView.topAnchor.constraint(equalTo: view.topAnchor),
            unityView.leftAnchor.constraint(equalTo: view.leftAnchor),
            unityView.rightAnchor.constraint(equalTo: view.rightAnchor),
            unityView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
