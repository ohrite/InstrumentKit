#import "Kiwi.h"
#import "NSObject+Swizzle.h"

SPEC_BEGIN(NSObjectSwizzleSpec)

describe(@"NSObject+Swizzle", ^{
  describe(@"swizzleInstanceSelector", ^{
    it(@"replaces the implementation of the original selector with the target selector", ^{
      [[[@"Help!" lowercaseString] should] equal:@"help!"];
      
      [NSString swizzleInstanceSelector:@selector(lowercaseString) withNewSelector:@selector(uppercaseString)];
      [[[@"Help!" lowercaseString] should] equal:@"HELP!"];

      [NSString swizzleInstanceSelector:@selector(uppercaseString) withNewSelector:@selector(lowercaseString)];
      [[[@"Help!" lowercaseString] should] equal:@"help!"];
    });
    
    it(@"replaces the implementation of the target selector with the original selector", ^{
      [[[@"Help!" uppercaseString] should] equal:@"HELP!"];

      [NSString swizzleInstanceSelector:@selector(lowercaseString) withNewSelector:@selector(uppercaseString)];
      [[[@"Help!" uppercaseString] should] equal:@"help!"];
   
      [NSString swizzleInstanceSelector:@selector(uppercaseString) withNewSelector:@selector(lowercaseString)];
      [[[@"Help!" uppercaseString] should] equal:@"HELP!"];
    });
  });
});

SPEC_END