#import "KEWLCoolView.h"

const CGFloat KEWLTextPadding = 8.0;

@interface KEWLCoolView ()

@property (nonatomic, assign) BOOL highlighted;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@end

#pragma mark -

@implementation KEWLCoolView

#pragma mark Initialization

- (void)configureLayer
{
    self.layer.borderWidth = 2.0;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = YES;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    [self configureLayer];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    [self configureLayer];
    return self;
}

- (void)prepareForInterfaceBuilder
{
    [super prepareForInterfaceBuilder];
    [self configureLayer];
}

#pragma mark Class-Level Defaults

+ (NSDictionary *)defaultTextAttributes
{
    return @{ NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0],
              NSForegroundColorAttributeName: [UIColor whiteColor] };
}

#pragma mark Property Accessors

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

#pragma mark Resizing

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = [self.text sizeWithAttributes:[self.class defaultTextAttributes]];
    newSize.width += 2 * KEWLTextPadding;
    newSize.height += 2 * KEWLTextPadding;
    return newSize;
}

#pragma mark Drawing

- (void)drawRect:(CGRect)rect
{
    [self.text drawAtPoint:CGPointMake(KEWLTextPadding, KEWLTextPadding)
            withAttributes:[self.class defaultTextAttributes]];
}

@end


#pragma mark - Animation

@implementation KEWLCoolView (KEWLAnimation)

- (void)configureFinalBounceWithSize:(CGSize)size
{
    self.transform = CGAffineTransformIdentity;
    self.frame = CGRectOffset(self.frame, -size.width, -size.height);
}

- (void)configureBounceWithSize:(CGSize)size
{
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    self.frame = CGRectOffset(self.frame, size.width, size.height);
    self.transform = CGAffineTransformMakeRotation(M_PI_2);
}

- (void)animateFinishBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size
{
    [UIView animateWithDuration:duration animations:^{
        [self configureFinalBounceWithSize:size];
    }];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size
{
    [UIView animateWithDuration:duration
                     animations:^{ [self configureBounceWithSize:size]; }
                     completion:^(BOOL finished) {
                         [self animateFinishBounceWithDuration:duration size:size];
                     }];
}

@end


#pragma mark - UIResponder Methods

@implementation KEWLCoolView (KEWLTouchHandling)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    [self.superview bringSubviewToFront:self];
    
    UITouch *touch = touches.anyObject;
    if (touch.tapCount == 2) {
        [self animateBounceWithDuration:1.0 size:CGSizeMake(120.0, 240.0)];
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
