//
//  UIView+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UIView+TAKExtensions.h"

@implementation UIView (TAKExtensions)

+ (UINib *)tak_defaultNib {
  return [[self class] tak_nibWithBundle:nil];
}

+ (UINib *)tak_nibWithBundle:(NSBundle *)bundle {
  return [UINib nibWithNibName:[[self class] tak_defaultNibName] bundle:bundle];
}

+ (instancetype)tak_viewFromDefaultNib {
  return [[self class] tak_viewFromDefaultNibWithOwner:nil];
}

+ (instancetype)tak_viewFromDefaultNibWithOwner:(id)owner {
  UINib *nib = [[self class] tak_defaultNib];
  NSArray *array = [nib instantiateWithOwner:owner options:nil];
  return array[0];
}

+ (NSString *)tak_defaultIdentifier {
  NSString *name = NSStringFromClass([self class]);
  return [[name componentsSeparatedByString:@"."] lastObject];
}

+ (NSString *)tak_defaultNibName {
  return [[self class] tak_defaultIdentifier];
}

@end
