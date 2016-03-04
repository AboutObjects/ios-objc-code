#import "KEWLCoolController.h"
#import "KEWLCoolView.h"

const CGFloat KEWLAccessoryHeight = 66.0;

@interface KEWLCoolController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIView *contentView;

@end


@implementation KEWLCoolController

- (void)dealloc
{
    self.textField.delegate = nil;
}


#pragma mark - Actions

- (IBAction)addCoolView
{
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

- (void)XXX2loadView
{
    NSBundle *appBundle = [NSBundle mainBundle];
    NSArray *topLevelObjs = [appBundle loadNibNamed:@"CoolStuff"
                                              owner:nil
                                            options:nil];
    self.view = topLevelObjs.firstObject;
}

- (void)XXX3loadView
{
    [[NSBundle mainBundle] loadNibNamed:@"CoolStuff" owner:self options:nil];
}

@end
