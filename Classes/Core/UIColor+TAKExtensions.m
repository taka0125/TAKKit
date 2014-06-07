//
//  UIColor+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UIColor+TAKExtensions.h"

@implementation UIColor (TAKExtensions)

+ (UIColor *)tak_RGBColor:(int)code {
  return [UIColor colorWithRed:((code >> 16) & 0xFF) / 255.0
                         green:((code >> 8) & 0xFF) / 255.0
                          blue:(code & 0xFF) / 255.0
                         alpha:1.0];
}

+ (UIColor *)tak_RGBAColor:(int)code {
  return [UIColor colorWithRed:((code >> 24) & 0xFF) / 255.0
                         green:((code >> 16) & 0xFF) / 255.0
                          blue:((code >> 8) & 0xFF) / 255.0
                         alpha:((code) & 0xFF) / 255.0];
}

@end
