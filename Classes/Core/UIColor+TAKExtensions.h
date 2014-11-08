//
//  UIColor+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UIColor_TAKExtensions_h
#define TAKKit_Core_UIColor_TAKExtensions_h

#import <UIKit/UIKit.h>

@interface UIColor (TAKExtensions)

+ (UIColor *)tak_RGBColor:(int)code;
+ (UIColor *)tak_RGBAColor:(int)code;

@end

#endif
