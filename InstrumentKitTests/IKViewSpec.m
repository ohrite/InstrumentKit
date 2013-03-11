#import "Kiwi.h"
#import "IKView.h"

SPEC_BEGIN(IKViewSpec)

describe(@"IKView", ^{
  __block IKView *model;
  __block UIView *view;
  
  beforeEach(^{
    view = [UIView mock];
    [view stub:@selector(superview) andReturn:nil];
    model = [[IKView alloc] initWithView:view];
  });
  
  describe(@"#description", ^{
    context(@"when the view has no superview", ^{
      context(@"when the view has no accessibilityIdentifier", ^{
        context(@"when the view has no accessibilityLabel", ^{
          it(@"returns the classname", ^{
            [[model.description should] equal:@"KWMock"];
          });
        });

        context(@"when the accessibilityLabel is defined", ^{
          beforeEach(^{
            view.accessibilityLabel = @"i don't use labels man";
          });
          
          it(@"returns the acccessibiltyLabel", ^{
            [[model.description should] equal:@"i don't use labels man"];
          });
        });
      });
      
      context(@"when the accessibilityIdentifier is defined", ^{
        beforeEach(^{
          view.accessibilityIdentifier = @"the government tracks your thoughts";
        });
        
        it(@"returns the acccessibiltyIdentifier", ^{
          [[model.description should] equal:@"the government tracks your thoughts"];
        });

        context(@"when the accessibilityLabel is defined", ^{
          beforeEach(^{
            view.accessibilityLabel = @"i don't use labels man";
          });
          
          it(@"returns the acccessibiltyIdentifier", ^{
            [[model.description should] equal:@"the government tracks your thoughts"];
          });
        });
      });
    });

    context(@"when the view has a superview", ^{
      __block UIView *fakeSuperview;
      
      beforeEach(^{
        fakeSuperview = [UIView mock];
        [fakeSuperview stub:@selector(superview) andReturn:nil];
        [view stub:@selector(superview) andReturn:fakeSuperview];
        
        view.accessibilityIdentifier = @"view";
        fakeSuperview.accessibilityIdentifier = @"super";
      });
      
      it(@"returns the superview description followed by the view description", ^{
        [[model.description should] equal:@"super.view"];
      });
    });
  });
});

SPEC_END