//
//  UITableView+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UITableView_TAKExtensions_h
#define TAKKit_Core_UITableView_TAKExtensions_h

#import <Foundation/Foundation.h>
#import "NSObject+TAKPerformBlock.h"

@interface UITableView (TAKExtensions)

- (void)reloadDataOnMainThread;
- (void)reloadDataOnMainThread:(TAKVoidBlock)completion;

@end

#endif
