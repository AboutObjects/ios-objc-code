#import "FABAppDelegate.h"
#import "FABViewController.h"

@implementation FABAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    self.window.rootViewController = [[FABViewController alloc] initWithNibName:@"MainView" bundle:nil];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
