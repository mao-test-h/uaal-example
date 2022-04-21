import Foundation

// refered to: https://qiita.com/noppefoxwolf/items/b43d8554142e69c2ada6
final class Unity: NSObject, UnityFrameworkListener, NativeCallsProtocol {
    static let shared = Unity()
    private let unityFramework: UnityFramework

    var view: UIView {
        unityFramework.appController().rootView
    }

    override init() {
        let bundlePath = Bundle.main.bundlePath
        let frameworkPath = bundlePath + "/Frameworks/UnityFramework.framework"

        guard let bundle = Bundle(path: frameworkPath) else {
            fatalError("failed init UnityFramework.")
        }

        if !bundle.isLoaded {
            bundle.load()
        }

        let frameworkClass = bundle.principalClass as! UnityFramework.Type
        guard let framework = frameworkClass.getInstance() else {
            fatalError("failed init UnityFramework.")
        }

        if framework.appController() == nil {
            // unity is not initialized
            var header = _mh_execute_header
            framework.setExecuteHeader(&header)
        }

        unityFramework = framework
        super.init()
    }


    // MARK:- NativeCallsProtocol

    func unityDidUnload(_ notification: Notification) {
    }

    func unityDidQuit(_ notification: Notification) {
    }

    // MARK:- NativeCallsProtocol

    func showHostMainWindow(_ color: Swift.String!) {

    }

    // MARK:- AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // Set UnityFramework target for Unity-iPhone/Data folder to make Data part of a UnityFramework.framework and uncomment call to setDataBundleId
        // ODR is not supported in this case, ( if you need embedded and ODR you need to copy data )
        unityFramework.setDataBundleId("com.unity3d.framework")
        unityFramework.register(self)
        FrameworkLibAPI.registerAPIforNativeCalls(self)
        unityFramework.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: launchOptions)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        unityFramework.appController().applicationWillResignActive(application)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        unityFramework.appController().applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        unityFramework.appController().applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        unityFramework.appController().applicationDidBecomeActive(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        unityFramework.appController().applicationWillTerminate(application)
    }
}
