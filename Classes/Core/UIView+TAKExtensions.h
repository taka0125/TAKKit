//
//  UIView+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UIView_TAKExtensions_h
#define TAKKit_Core_UIView_TAKExtensions_h

#import <Foundation/Foundation.h>

@interface UIView (TAKExtensions)

+ (UINib *)defaultNib;
+ (instancetype)viewFromDefaultNib;
+ (NSString *)defaultIdentifier;
+ (NSString *)defaultNibName;

@end

#endif
