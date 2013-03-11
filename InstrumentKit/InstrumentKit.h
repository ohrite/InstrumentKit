//
//  InstrumentKit.h
//  InstrumentKit
//
//  Created by pivotal on 3/11/13.
//  Copyright (c) 2013 fulcrumlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NSObject+Swizzle.h"

typedef void (^IKTouchInterceptor)(UITouch *);

@interface InstrumentKit : NSObject

+ (void)addTouchInterceptor:(IKTouchInterceptor)interceptor toApplication:(UIApplication *)application;

@end

