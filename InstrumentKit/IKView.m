//
//  IKView.m
//  InstrumentKit
//
//  Created by pivotal on 3/11/13.
//  Copyright (c) 2013 fulcrumlabs. All rights reserved.
//

#import "IKView.h"

@interface IKView()
@property (strong) UIView *view;
@end

@implementation IKView

@synthesize view = _view;

- (id)initWithView:(UIView *)view {
  if (self = [super init]) {
    _view = view;
  }
  return self;
}

- (NSString *)description {
  return [[self hierarchyFromView:_view] componentsJoinedByString:@"."];
}

- (NSArray *)hierarchyFromView:(UIView *)view {
  NSMutableArray *hierarchy = [[NSMutableArray alloc] init];
  
  do {
    [hierarchy insertObject:[self nameFromView:view] atIndex:0];
    view = view.superview;
  } while (view != nil);
  
  return hierarchy;
};

- (NSString *)nameFromView:(UIView *)view {
  if (view.accessibilityIdentifier.length == 0) {
    if (view.accessibilityLabel.length == 0) {
      return NSStringFromClass(view.class);
    } else {
      return view.accessibilityLabel;
    }
  } else {
    return view.accessibilityIdentifier;
  }
}

@end
