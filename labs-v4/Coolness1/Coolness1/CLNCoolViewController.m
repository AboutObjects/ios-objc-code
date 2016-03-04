//
//  CLNCoolViewController.m
//  Coolness1
//
//  Created by Jonathan Lehr on 3/4/16.
//  Copyright © 2016 About Objects. All rights reserved.
//

#import "CLNCoolViewController.h"

// ➊ A global constant that defines a frame rectangle
// to use as a set of base values when initializing subviews.
const CGRect CLNCoolRect = {
    .origin = { .x = 20.0, .y = 60.0 },
    .size   = { .width = 80.0, .height = 30.0 }
};


@implementation CLNCoolViewController

- (void)loadView
{
    // ➋ Instantiates a view that will serve as a background for
    // other views, storing a reference in the view property.
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:screenRect];
    
    // ➌ Creates two additional views, adding them to the subviews array.
    UIView *coolView1 = [[UIView alloc] initWithFrame:CLNCoolRect];
    UIView *coolView2 = [[UIView alloc] initWithFrame:
                         CGRectOffset(CLNCoolRect, 30.0, 50.0)];
    [self.view addSubview:coolView1];
    [self.view addSubview:coolView2];
    
    // ➍ Configures background colors.
    coolView1.backgroundColor = [UIColor purpleColor];
    coolView2.backgroundColor = [UIColor orangeColor];
    self.view.backgroundColor = [UIColor brownColor];
}

@end
