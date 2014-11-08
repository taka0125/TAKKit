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

#import <UIKit/UIKit.h>

@interface UIView (TAKExtensions)

+ (UINib *)tak_defaultNib;
+ (instancetype)tak_viewFromDefaultNib;
+ (instancetype)tak_viewFromDefaultNibWithOwner:(id)owner;
+ (NSString *)tak_defaultIdentifier;
+ (NSString *)tak_defaultNibName;

@end

#endif
