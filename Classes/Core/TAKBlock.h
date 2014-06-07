//
//  TAKBlock.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_TAKBlock_h
#define TAKKit_Core_TAKBlock_h

#import <Foundation/Foundation.h>

typedef void (^TAKVoidBlock)(void);

@interface TAKBlock : NSObject

+ (void)runOnMainThread:(TAKVoidBlock)block;
+ (void)runOnMainThread:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay;

+ (void)runInBackground:(TAKVoidBlock)block;
+ (void)runInBackground:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay;

+ (void)run:(dispatch_queue_t)queue block:(TAKVoidBlock)block;
+ (void)run:(dispatch_queue_t)queue block:(TAKVoidBlock)block afterDelay:(NSTimeInterval)delay;

@end

#endif
