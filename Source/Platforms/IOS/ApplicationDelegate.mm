// Copyright ❤️ 2025, Wow Play

#import "ApplicationDelegate.h"
#import "ViewController.h"

@implementation ApplicationDelegate
- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[ViewController alloc] init];

	[self.window makeKeyAndVisible];

	return YES;
}
@end