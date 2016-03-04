@class FABQuotationView;
@class FABGeometryView;

#import <UIKit/UIKit.h>

@interface FABViewController : UIViewController

@property (weak, nonatomic) IBOutlet FABQuotationView *quotationView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toggleGeometryItem;

@property (weak, nonatomic) IBOutlet FABGeometryView *geometryView;

- (IBAction)scroll:(UIPanGestureRecognizer *)panRecognizer;
- (IBAction)grow:(UITapGestureRecognizer *)tapRecognizer;
- (IBAction)resize:(UIPinchGestureRecognizer *)pinchRecognizer;
- (IBAction)rotate:(UIRotationGestureRecognizer *)rotationRecognizer;

- (IBAction)toggleGeometry:(UIBarButtonItem *)sender;

@end
