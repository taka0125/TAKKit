//
//  UIAlertView+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UIAlertView+TAKExtensions.h"
#import <objc/runtime.h>

@implementation UIAlertView (TAKExtensions)

- (id)initWithTitle:(NSString *)title message:(NSString *)message callback:(TAKAlertViewCallback)callback cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
  objc_setAssociatedObject(self, "callbackBlock", (__bridge id)Block_copy((__bridge void *)callback), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  
  self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
  if (!self) return nil;
  
  va_list args;
  va_start(args, otherButtonTitles);
  for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
    [self addButtonWithTitle:arg];
  }
  va_end(args);
  
  return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  TAKAlertViewCallback callback = objc_getAssociatedObject(self, "callbackBlock");
  if (callback) {
    callback(buttonIndex);
  }
  Block_release((__bridge void *)callback);
}

@end
