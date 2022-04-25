import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var unity: Unity? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        unity = Unity.shared
        unity?.application(application, didFinishLaunchingWithOptions: launchOptions)

        window = .init(frame: UIScreen.main.bounds)
        window?.rootViewController = SampleViewController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        unity?.applicationWillResignActive(application)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        unity?.applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        unity?.applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        unity?.applicationDidBecomeActive(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        unity?.applicationWillTerminate(application)
    }
}
