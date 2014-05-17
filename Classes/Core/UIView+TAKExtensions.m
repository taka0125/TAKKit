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

+ (UINib *)defaultNib {
  return [UINib nibWithNibName:[[self class] defaultNibName] bundle:nil];
}

+ (instancetype)viewFromDefaultNib {
  UINib *nib = [[self class] defaultNib];
  NSArray *array = [nib instantiateWithOwner:nil options:nil];
  return array[0];
}

+ (NSString *)defaultIdentifier {
  return NSStringFromClass([self class]);
}

+ (NSString *)defaultNibName {
  return [[self class] defaultIdentifier];
}

@end
