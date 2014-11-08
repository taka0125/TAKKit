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

+ (instancetype)tak_defaultController {
  NSString *nibName = [[self class] tak_defaultNibName];
  return [[[self class] alloc] initWithNibName:nibName bundle:nil];
}

+ (NSString *)tak_defaultNibName {
  return NSStringFromClass([self class]);
}

@end
