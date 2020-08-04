#import "FileencryptorPlugin.h"
#if __has_include(<fileencryptor/fileencryptor-Swift.h>)
#import <fileencryptor/fileencryptor-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fileencryptor-Swift.h"
#endif

@implementation FileencryptorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFileencryptorPlugin registerWithRegistrar:registrar];
}
@end
