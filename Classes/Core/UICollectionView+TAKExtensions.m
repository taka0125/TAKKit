//
//  UICollectionView+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UICollectionView+TAKExtensions.h"
#import "TAKBlock.h"

@implementation UICollectionView (TAKExtensions)

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
