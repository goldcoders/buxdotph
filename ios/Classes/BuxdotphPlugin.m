#import "BuxdotphPlugin.h"
#if __has_include(<buxdotph/buxdotph-Swift.h>)
#import <buxdotph/buxdotph-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "buxdotph-Swift.h"
#endif

@implementation BuxdotphPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBuxdotphPlugin registerWithRegistrar:registrar];
}
@end
