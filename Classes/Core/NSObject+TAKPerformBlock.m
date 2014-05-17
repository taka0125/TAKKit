//
//  NSObject+TAKPerformBlock.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "NSObject+TAKPerformBlock.h"

@implementation NSObject (TAKPerformBlock)

- (void)perform:(dispatch_queue_t)queue block:(TAKVoidBlock)block {
  dispatch_async(queue, block);
}

- (void)perform:(dispatch_queue_t)queue block:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), queue, block);
}

#pragma mark MainThread

- (void)performBlockOnMainThread:(TAKVoidBlock)block {
  [self perform:dispatch_get_main_queue() block:block];
}

- (void)performBlockOnMainThread:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  [self perform:dispatch_get_main_queue() block:block afterDelay:delay];
}

#pragma mark Background

- (void)performBlockInBackground:(TAKVoidBlock)block {
  [self perform:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:block];
}

- (void)performBlockInBackground:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  [self perform:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:block afterDelay:delay];
}

@end
