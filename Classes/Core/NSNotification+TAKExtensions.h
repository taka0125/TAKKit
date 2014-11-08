//
//  NSNotification+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_NSNotification_TAKExtensions_h
#define TAKKit_Core_NSNotification_TAKExtensions_h

#import <Foundation/Foundation.h>

@interface NSNotification (TAKExtensions)

+ (instancetype)tak_notificationWithName:(NSString *)aName object:(id)anObject parameters:(id)parameters;

- (id)tak_parameters;

@end

#endif
