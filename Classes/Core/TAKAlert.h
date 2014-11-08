//
//  TAKAlert.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_TAKAlert_h
#define TAKKit_Core_TAKAlert_h

#import <UIKit/UIKit.h>

@interface TAKAlert : NSObject

+ (void)showWithTitle:(NSString *)title message:(NSString *)message;

@end

#endif
