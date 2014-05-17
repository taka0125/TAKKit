//
//  UIActionSheet+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UIActionSheet+TAKExtensions.h"
#import <objc/runtime.h>

@implementation UIActionSheet (TAKExtensions)

- (id)initWithTitle:(NSString *)title callback:(TAKActionSheetCallback)callback {
  objc_setAssociatedObject(self, "callbackBlock", (__bridge id)Block_copy((__bridge void *)callback), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  self = [self initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
  if (!self) return nil;
  return self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  TAKActionSheetCallback callback = objc_getAssociatedObject(self, "callbackBlock");
  callback(buttonIndex);
  Block_release((__bridge void *)callback);
}

@end
