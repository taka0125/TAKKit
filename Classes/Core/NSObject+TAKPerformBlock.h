//
//  NSObject+TAKPerformBlock.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_NSObject_TAKPerformBlock_h
#define TAKKit_Core_NSObject_TAKPerformBlock_h

#import <Foundation/Foundation.h>

typedef void (^TAKVoidBlock)(void);

@interface NSObject (TAKPerformBlock)

- (void)perform:(dispatch_queue_t)queue block:(TAKVoidBlock)block;
- (void)perform:(dispatch_queue_t)queue block:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay;

- (void)performBlockOnMainThread:(TAKVoidBlock)block;
- (void)performBlockOnMainThread:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay;

- (void)performBlockInBackground:(TAKVoidBlock)block;
- (void)performBlockInBackground:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay;

@end

#endif
