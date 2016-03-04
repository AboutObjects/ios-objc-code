#import "KEWLCoolController.h"
#import "KEWLCoolView.h"

const CGFloat KEWLAccessoryHeight = 66.0;


@interface KEWLCoolController () <UITextFieldDelegate>

@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, weak) UIView *contentView;

@end


@implementation KEWLCoolController

- (void)dealloc
{
    self.textField.delegate = nil;
}


#pragma mark - Actions

- (void)addCoolView
{
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    
    KEWLCoolView *coolView = [[KEWLCoolView alloc] init];
    coolView.text = self.textField.text;
    [coolView sizeToFit];
    
    [self.contentView addSubview:coolView];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - UIViewController

- (void)loadView
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    CGRect accessoryRect = CGRectMake(0.0, 0.0, CGRectGetWidth(screenRect), KEWLAccessoryHeight);
    CGRect contentRect = CGRectMake(0.0,
                                    KEWLAccessoryHeight,
                                    CGRectGetWidth(screenRect),
                                    CGRectGetHeight(screenRect) - KEWLAccessoryHeight);
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:screenRect];
    
    self.view = backgroundView;
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    
    [backgroundView addSubview:accessoryView];
    [backgroundView addSubview:contentView];
    
    contentView.clipsToBounds = YES;
    self.contentView = contentView;
    
    
    // Controls
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(8.0, 28.0, 260.0, 30.0)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter some text";
    
    self.textField = textField;
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    
    button.frame = CGRectOffset(button.frame, 278.0, 28.0);
    
    [button addTarget:self
               action:@selector(addCoolView)
     forControlEvents:UIControlEventTouchUpInside];
    
    [accessoryView addSubview:textField];
    [accessoryView addSubview:button];
    
    // Cool Views

    KEWLCoolView *view1 = [[KEWLCoolView alloc] initWithFrame:CGRectMake(20.0, 20.0, 80.0, 30.0)];
    KEWLCoolView *view2 = [[KEWLCoolView alloc] initWithFrame:CGRectMake(50.0, 80.0, 80.0, 30.0)];
    
    [contentView addSubview:view1];
    [contentView addSubview:view2];
    
    view1.text = @"Now on the App Store.";
    view2.text = @"Only $0.99.";
    
    [view1 sizeToFit];
    [view2 sizeToFit];
    
    view1.backgroundColor = [UIColor purpleColor];
    view2.backgroundColor = [UIColor orangeColor];
    backgroundView.backgroundColor = [UIColor brownColor];
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
}

@end
