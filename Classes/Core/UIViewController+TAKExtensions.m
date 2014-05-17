//
//  UIViewController+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UIViewController+TAKExtensions.h"

@implementation UIViewController (TAKExtensions)

- (id)initWithDefault {
  NSString *nibName = [[self class] defaultNibName];
  self = [self initWithNibName:nibName bundle:nil];
  if (!self) return nil;
  return self;
}

+ (id)defaultController {
  return [[[self class] alloc] initWithDefault];
}

+ (NSString *)defaultNibName {
  return NSStringFromClass([self class]);
}

@end
