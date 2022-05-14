// [!] important set UnityFramework in Target Membership for this file
// [!]           and set Public header visibility

#import <Foundation/Foundation.h>

typedef void (* callbackDelegate)(int);

// NativeCallsProtocol defines protocol with methods you want to be called from managed
// NOTE: これをネイティブアプリ側で実装することでUnityからのイベントを受け取ることが可能
@protocol NativeCallsProtocol
@required

- (void)showHostMainWindow:(NSString*)color;

- (void)onReady;

- (void)registerCallback:(callbackDelegate)delegate;

@end

__attribute__ ((visibility("default")))
@interface FrameworkLibAPI : NSObject

// call it any time after UnityFrameworkLoad to set object implementing NativeCallsProtocol methods
+ (void)registerAPIforNativeCalls:(id <NativeCallsProtocol>)aApi;

@end
