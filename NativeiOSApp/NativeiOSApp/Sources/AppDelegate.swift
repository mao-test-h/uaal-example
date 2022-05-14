import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let window: UIWindow? = .init(frame: UIScreen.main.bounds)
    let unity: Unity = Unity.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        unity.application(application, didFinishLaunchingWithOptions: launchOptions) { [weak self] in
            // Unityのロードが完了したら本来表示したいViewControllerに切り替える
            let rootViewController = SampleViewController()
            self?.window?.rootViewController = rootViewController

            // 起動時にUnityを停止しておきたいなら以下を有効にする
            /*
            DispatchQueue.main.async {
                self?.unity.pause(true)
            }
             */
        }

        // UaaLのロードが完了するまではダミーを表示
        let rootViewController = LaunchViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        unity.applicationWillResignActive(application)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        unity.applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        unity.applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        unity.applicationDidBecomeActive(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        unity.applicationWillTerminate(application)
    }
}
