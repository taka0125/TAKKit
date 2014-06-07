//
//  TAKBlock.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKBlock.h"

@implementation TAKBlock

#pragma mark - MainThread

+ (void)runOnMainThread:(TAKVoidBlock)block {
  [self run:dispatch_get_main_queue() block:block];
}

+ (void)runOnMainThread:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  [self run:dispatch_get_main_queue() block:block afterDelay:delay];
}

#pragma mark - Background

+ (void)runInBackground:(TAKVoidBlock)block {
  [self run:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:block];
}

+ (void)runInBackground:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  [self run:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) block:block afterDelay:delay];
}

#pragma mark - Queue

+ (void)run:(dispatch_queue_t)queue block:(TAKVoidBlock)block {
  dispatch_async(queue, block);
}

+ (void)run:(dispatch_queue_t)queue block:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), queue, block);
}

@end