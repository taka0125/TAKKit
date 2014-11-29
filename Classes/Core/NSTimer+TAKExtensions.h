//
//  NSTimer+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_NSTimer_TAKExtensions_h
#define TAKKit_Core_NSTimer_TAKExtensions_h

#import <UIKit/UIKit.h>

@interface NSTimer (TAKExtensions)

+ (NSTimer *)tak_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void(^)())block repeats:(BOOL)repeats;

@end

#endif
