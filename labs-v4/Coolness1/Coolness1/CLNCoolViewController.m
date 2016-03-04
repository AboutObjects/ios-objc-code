//
//  CLNCoolViewController.m
//  Coolness1
//
//  Created by Jonathan Lehr on 3/4/16.
//  Copyright © 2016 About Objects. All rights reserved.
//

#import "CLNCoolViewController.h"

const CGRect CLNCoolRect = {
    .origin = { .x = 20.0, .y = 60.0 },
    .size   = { .width = 80.0, .height = 30.0 }
};


@implementation CLNCoolViewController

- (void)loadView
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:screenRect];
    
    UIView *coolView1 = [[UIView alloc] initWithFrame:CLNCoolRect];
    UIView *coolView2 = [[UIView alloc] initWithFrame:
                         CGRectOffset(CLNCoolRect, 30.0, 50.0)];
    [self.view addSubview:coolView1];
    [self.view addSubview:coolView2];
    
    coolView1.backgroundColor = [UIColor purpleColor];
    coolView2.backgroundColor = [UIColor orangeColor];
    self.view.backgroundColor = [UIColor brownColor];
}

@end
