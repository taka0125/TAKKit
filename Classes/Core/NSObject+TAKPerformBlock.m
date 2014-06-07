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
  [TAKBlock run:queue block:block];
}

- (void)perform:(dispatch_queue_t)queue block:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  [TAKBlock run:queue block:block afterDelay:delay];
}

#pragma mark MainThread

- (void)performBlockOnMainThread:(TAKVoidBlock)block {
  [TAKBlock runOnMainThread:block];
}

- (void)performBlockOnMainThread:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  [TAKBlock runOnMainThread:block afterDelay:delay];
}

#pragma mark Background

- (void)performBlockInBackground:(TAKVoidBlock)block {
  [TAKBlock runInBackground:block];
}

- (void)performBlockInBackground:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay {
  [TAKBlock runInBackground:block afterDelay:delay];
}

@end
