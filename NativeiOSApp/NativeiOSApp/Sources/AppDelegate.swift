import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // UaaLの初期化を成功させるために仮のViewControllerを用いてWindowを作っておく
        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchViewController()
        window?.makeKeyAndVisible()

        Unity.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

        window?.rootViewController = SampleViewController()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        Unity.shared.applicationWillResignActive(application)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        Unity.shared.applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        Unity.shared.applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        Unity.shared.applicationDidBecomeActive(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        Unity.shared.applicationWillTerminate(application)
    }
}
