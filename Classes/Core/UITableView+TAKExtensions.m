//
//  UITableView+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UITableView+TAKExtensions.h"
#import "NSObject+TAKPerformBlock.h"

@implementation UITableView (TAKExtensions)

- (void)reloadDataOnMainThread {
  [self reloadDataOnMainThread:nil];
}

- (void)reloadDataOnMainThread:(TAKVoidBlock)completion {
  __weak typeof(self) weakSelf = self;
  [self performBlockOnMainThread:^{
    __strong typeof(weakSelf) strongSelf = weakSelf;
    if (!strongSelf) return ;

    [strongSelf reloadData];
    if (completion) {
      completion();
	}
  }];
}

@end
