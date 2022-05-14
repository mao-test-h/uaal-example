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

void ready() {
    [api onReady];
}

void registerSampleCallback(callbackDelegate callbackDelegate) {
    [api registerCallback:callbackDelegate];
}

}
