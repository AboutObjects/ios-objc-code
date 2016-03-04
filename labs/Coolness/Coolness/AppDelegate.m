#import "AppDelegate.h"
#import "KEWLCoolView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:screenRect];
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    [self.window addSubview:[self loadView]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

// FIXME: Move me to a UIViewController subclass.

- (UIView *)loadView
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
//    screenRect = CGRectInset(screenRect, 5.0, 5.0);
    UIView *backgroundView = [[UIView alloc] initWithFrame:screenRect];
    
    KEWLCoolView *view1 = [[KEWLCoolView alloc] initWithFrame:CGRectMake(20.0, 60.0, 80.0, 30.0)];
    KEWLCoolView *view2 = [[KEWLCoolView alloc] initWithFrame:CGRectMake(50.0, 110.0, 80.0, 30.0)];
    
    [backgroundView addSubview:view1];
    [backgroundView addSubview:view2];
    
    view1.text = @"Now on the App Store.";
    view2.text = @"Only $0.99.";
    
    [view1 sizeToFit];
    [view2 sizeToFit];
    
    view1.backgroundColor = [UIColor purpleColor];
    view2.backgroundColor = [UIColor orangeColor];
    backgroundView.backgroundColor = [UIColor brownColor];
    
    return backgroundView;
}

@end


