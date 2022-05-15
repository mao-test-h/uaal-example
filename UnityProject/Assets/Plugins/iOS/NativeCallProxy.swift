import Foundation

// NOTE: `@convention(c)`はC言語の関数ポインタ形式を指す
// ref: https://qiita.com/shtnkgm/items/a793f26445f2b8390bee#convention
public typealias CallbackDelegate = @convention(c) (Int32) -> Void

// NOTE: これをネイティブアプリ側で実装することでUnityからのイベントを受け取ることが可能
public protocol NativeCallsProtocol {
    func showHostMainWindow(_ color: String)
    func onReady()
    func registerCallback(_ callbackDelegate: @escaping CallbackDelegate)
}

public final class FrameworkLibAPI {
    static var api: NativeCallsProtocol? = nil;

    public static func registerAPIforNativeCalls(_ api: NativeCallsProtocol) {
        FrameworkLibAPI.api = api
    }
}

// MARK:- P/Invoke

@_cdecl("showHostMainWindow")
func showHostMainWindow(_ stringPtr: UnsafePointer<CChar>?) {
    let colorStr = String(cString: stringPtr!)
    FrameworkLibAPI.api?.showHostMainWindow(colorStr)
}

@_cdecl("ready")
func ready() {
    FrameworkLibAPI.api?.onReady()
}

@_cdecl("registerSampleCallback")
func registerSampleCallback(_ callbackDelegate: @escaping CallbackDelegate) {
    FrameworkLibAPI.api?.registerCallback(callbackDelegate)
}
