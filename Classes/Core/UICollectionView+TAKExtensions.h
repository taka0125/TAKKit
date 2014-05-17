//
//  UICollectionView+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UICollectionView_TAKExtensions_h
#define TAKKit_Core_UICollectionView_TAKExtensions_h

#import <Foundation/Foundation.h>
#import "NSObject+TAKPerformBlock.h"

@interface UICollectionView (TAKExtensions)

- (void)reloadDataOnMainThread;
- (void)reloadDataOnMainThread:(TAKVoidBlock)completion;

@end

#endif
