//
//  UIViewController+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UIViewController_TAKExtensions_h
#define TAKKit_Core_UIViewController_TAKExtensions_h

#import <UIKit/UIKit.h>

@interface UIViewController (TAKExtensions)

+ (instancetype)tak_defaultController;

+ (NSString *)tak_defaultNibName;

@end

#endif
