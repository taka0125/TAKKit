//
//  UIStoryboard+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UIStoryboard_TAKExtensions_h
#define TAKKit_Core_UIStoryboard_TAKExtensions_h

#import <UIKit/UIKit.h>

@interface UIStoryboard (TAKExtensions)

- (id)tak_instantiateViewControllerWithClass:(id)klass;

@end

#endif
