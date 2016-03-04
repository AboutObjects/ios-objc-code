#import "KEWLCoolView.h"

const CGFloat KEWLTextPadding = 8.0;


@implementation KEWLCoolView

// TODO: Implement initWithCoder:.

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = YES;
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    
    self.alpha = highlighted ? 0.5 : 1.0;
}

+ (NSDictionary *)defaultTextAttributes
{
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0],
              NSForegroundColorAttributeName: [UIColor whiteColor] };
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = [self.text sizeWithAttributes:[self.class defaultTextAttributes]];
    newSize.width += 2 * KEWLTextPadding;
    newSize.height += 2 * KEWLTextPadding;
    return newSize;
}

- (void)drawRect:(CGRect)rect
{
    [self.text drawAtPoint:CGPointMake(KEWLTextPadding, KEWLTextPadding)
            withAttributes:[self.class defaultTextAttributes]];
}

@end


@implementation KEWLCoolView (KEWLAnimation)

- (void)animateFinishBounceWithTimer:(NSTimer *)timer
{
    NSValue *sizeValue = timer.userInfo;
    CGSize size = sizeValue.CGSizeValue;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    
    self.transform = CGAffineTransformIdentity;
    self.frame = CGRectOffset(self.frame, -size.width, -size.height);
    
    [UIView commitAnimations];
}

- (void)animateBounceWithSize:(CGSize)size
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.frame = CGRectOffset(self.frame, size.width, size.height);
    self.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    [UIView commitAnimations];
}

@end



@implementation KEWLCoolView (KEWLTouchHandling)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    [self.superview bringSubviewToFront:self];
    
    UITouch *touch = touches.anyObject;
    if (touch.tapCount == 2) {
        CGSize size = CGSizeMake(120.0, 240.0);
        [self animateBounceWithSize:size];
        
        [NSTimer scheduledTimerWithTimeInterval:7.0
                                         target:self
                                       selector:@selector(animateFinishBounceWithTimer:)
                                       userInfo:[NSValue valueWithCGSize:size]
                                        repeats:NO];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    
    CGPoint currLocation = [touch locationInView:self];
    CGPoint prevLocation = [touch previousLocationInView:self];
    
    CGPoint newLocation = self.center;
    newLocation.x += currLocation.x - prevLocation.x;
    newLocation.y += currLocation.y - prevLocation.y;
    
    self.center = newLocation;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}


@end
