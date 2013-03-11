//
//  NSObject+Swizzle.h
//  InstrumentKit
//
//  Created by Doc Ritezel on 2/20/13.
//  Copyright (c) 2013 Doc Ritezel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)swizzleInstanceSelector:(SEL)originalSelector
                withNewSelector:(SEL)newSelector;

@end