#import "FABQuotationView.h"
#import "FABGeometryView.h"

@implementation FABQuotationView

- (void)configureLayer
{
    self.layer.borderWidth = 2.0;
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

- (void)drawRect:(CGRect)rect
{
    NSString *text = @"Now is the time\nfor all good men\nto come to the aid\nof their country.";
    UIFont *font = [UIFont fontWithName:@"Zapfino" size:24];
    
    [text drawAtPoint:CGPointMake(20.0, 20.0) withAttributes:@{NSFontAttributeName:font}];
}

@end
