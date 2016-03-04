#import <XCTest/XCTest.h>

void SaySomething(void (*)(void));


void SayHello(void)
{
    printf("Hello!\n");
}

void SaySomething(void (*thingToSay)(void))
{
    thingToSay();
}


@interface BlockLiteralTests : XCTestCase @end

@implementation BlockLiteralTests

- (void)setUp    { [super setUp]; putchar('\n'); }
- (void)tearDown { putchar('\n'); [super tearDown]; }

- (void)testFunctionPointerSyntax
{
    SayHello();
    
    void (*myFunctionPtr)(void);
    
    myFunctionPtr = SayHello;
    
    myFunctionPtr();
}

- (void)testPassingAFunctionPointer
{
    SaySomething(SayHello);
}


- (void)testBlockLiteralSyntax
{
    void (^myBlock)(void);
    
    myBlock = ^{
        printf("Hi there!\n");
    };
    
    myBlock();
}

- (void)testCaptureLocalState
{
//    NSString * __weak foo = [NSString stringWithFormat:@"Foo"];
    
    char * __block today = "Wednesday";
    
    void (^myBlock)(void);
    
    myBlock = ^{
        printf("Today is %s!\n", today);
        today = "Friday";
    };
    
    myBlock();

//    today = "Thursday";
    
    myBlock();
}






@end
