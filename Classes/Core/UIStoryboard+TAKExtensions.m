//
//  UIStoryboard+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UIStoryboard+TAKExtensions.h"

@implementation UIStoryboard (TAKExtensions)

- (id)instantiateViewControllerWithClass:(id)klass {
  return [self instantiateViewControllerWithIdentifier:NSStringFromClass(klass)];
}

@end
