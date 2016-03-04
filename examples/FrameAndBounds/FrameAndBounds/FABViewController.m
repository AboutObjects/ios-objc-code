#import "FABViewController.h"
#import "FABQuotationView.h"
#import "FABGeometryView.h"

NSString * const HideGeometryTitle = @"Hide Geometry";
NSString * const ShowGeometryTitle = @"Show Geometry";

@implementation FABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self toggleGeometry:self.toggleGeometryItem];
}

- (IBAction)toggleGeometry:(UIBarButtonItem *)sender
{
    sender.title = ([sender.title isEqualToString:HideGeometryTitle] ?
                    ShowGeometryTitle : HideGeometryTitle);
    
    self.geometryView.hidden = self.geometryView.hidden ? NO : YES;
}


- (IBAction)grow:(UITapGestureRecognizer *)tapRecognizer
{
    tapRecognizer.view.bounds = CGRectInset(tapRecognizer.view.bounds, -10.0, -10.0);
    [self.geometryView update];
}

- (IBAction)scroll:(UIPanGestureRecognizer *)panRecognizer
{
    UIView *view = panRecognizer.view;
    CGPoint translation = [panRecognizer translationInView:panRecognizer.view];
    view.bounds = CGRectOffset(view.bounds, -translation.x, -translation.y);
    
    [panRecognizer setTranslation:CGPointZero inView:view.superview];
    [self.geometryView update];
}

- (IBAction)resize:(UIPinchGestureRecognizer *)pinchRecognizer
{
    UIView *view = pinchRecognizer.view;
    view.bounds = CGRectMake(CGRectGetMinX(view.bounds),
                             CGRectGetMinY(view.bounds),
                             CGRectGetWidth(view.bounds) * pinchRecognizer.scale,
                             CGRectGetHeight(view.bounds) * pinchRecognizer.scale);
    
    pinchRecognizer.scale = 1.0;
    [self.geometryView update];
}

- (void)rotate:(UIRotationGestureRecognizer *)rotationRecognizer
{
    rotationRecognizer.view.transform = CGAffineTransformRotate(rotationRecognizer.view.transform,
                                                                rotationRecognizer.rotation);
    rotationRecognizer.rotation = 0.0;
    [self.geometryView update];
}

@end
