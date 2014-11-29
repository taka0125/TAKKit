//
//  NSTimer+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "NSTimer+TAKExtensions.h"

@implementation NSTimer (TAKExtensions)

+ (NSTimer *)tak_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void(^)())block repeats:(BOOL)repeats {
  return [self scheduledTimerWithTimeInterval:seconds target:self selector:@selector(tak_callBlock:) userInfo:[block copy] repeats:repeats];
}

+ (void)tak_callBlock:(NSTimer *)timer {
  void (^block)() = timer.userInfo;
  if (!block) return;
  block();
}

@end
