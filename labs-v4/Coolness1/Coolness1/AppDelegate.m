//
//  AppDelegate.m
//  Coolness1
//
//  Created by Jonathan Lehr on 3/4/16.
//  Copyright © 2016 About Objects. All rights reserved.
//

#import "AppDelegate.h"
#import "CLNCoolViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:screenRect];
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    self.window.rootViewController = [[CLNCoolViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
