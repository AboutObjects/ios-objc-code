#import "FABGeometryView.h"

@implementation FABGeometryView

- (void)awakeFromNib
{
    [self update];
}

- (void)configureLayer
{
    self.layer.cornerRadius = 7.0;
    self.layer.masksToBounds = YES;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    [self configureLayer];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    [self configureLayer];
    return self;
}

- (void)update
{
    CGRect bounds = self.targetView.bounds;
    CGRect frame = self.targetView.frame;
    
    self.boundsOriginLabel.text = [NSString stringWithFormat:@"%.0f, %.0f", CGRectGetMinX(bounds), CGRectGetMinY(bounds)];
    self.frameOriginLabel.text = [NSString stringWithFormat:@"%.0f, %.0f", CGRectGetMinX(frame), CGRectGetMinY(frame)];
    self.boundsSizeLabel.text = [NSString stringWithFormat:@"%.0f, %.0f", CGRectGetWidth(bounds), CGRectGetHeight(bounds)];
    self.frameSizeLabel.text = [NSString stringWithFormat:@"%.0f, %.0f", CGRectGetWidth(frame), CGRectGetHeight(frame)];
    
    [self setNeedsDisplay];
}

@end
