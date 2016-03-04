#import <UIKit/UIKit.h>

@interface FABGeometryView : UIView

@property (weak, nonatomic) IBOutlet UILabel *boundsOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *frameOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *frameSizeLabel;

@property (weak, nonatomic) IBOutlet UIView *targetView;

- (void)update;

@end
