#import <Foundation/Foundation.h>
#import "NativeCallProxy.h"

@implementation FrameworkLibAPI

id <NativeCallsProtocol> api = NULL;

+ (void)registerAPIforNativeCalls:(id <NativeCallsProtocol>)aApi {
    api = aApi;
}

@end

// MARK:- P/Invoke

extern "C" {
void showHostMainWindow(const char* color) {
    return [api showHostMainWindow:[NSString stringWithUTF8String:color]];
}

void wakeUp() {
    return [api wakeUp];
}

void onClickTest() {
    [api onClickTest];
}

void sendMousePosition(float x, float y, float z) {
    [api sendMousePosition:x :y :z];
}

}
