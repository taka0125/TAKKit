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
#import "TAKBlock.h"

@interface UITableView (TAKExtensions)

- (void)tak_reloadDataOnMainThread;
- (void)tak_reloadDataOnMainThread:(TAKVoidBlock)completion;

@end

#endif
