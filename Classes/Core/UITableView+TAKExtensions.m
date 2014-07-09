//
//  UITableView+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UITableView+TAKExtensions.h"
#import "TAKBlock.h"

@implementation UITableView (TAKExtensions)

- (void)tak_reloadDataOnMainThread {
  [self tak_reloadDataOnMainThread:nil];
}

- (void)tak_reloadDataOnMainThread:(TAKVoidBlock)completion {
  [TAKBlock runOnMainThread:^{
    [self reloadData];
    if (completion) {
      completion();
    }
  }];
}

@end
