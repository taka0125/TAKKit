//
//  TAKAlert.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKAlert.h"
#import "TAKBlock.h"
#import "TAKWord.h"

@implementation TAKAlert

+ (void)showWithTitle:(NSString *)title message:(NSString *)message {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:L(@"OK") otherButtonTitles:nil];
  
  TAKVoidBlock block = ^{
    [alert show];
  };
  
  if ([NSThread isMainThread]) {
    block();
  } else {
    [TAKBlock runOnMainThread:block];
  }
}

+ (void)showOnMainThreadWithTitle:(NSString *)title message:(NSString *)message {
  [self showWithTitle:title message:message];
}

@end
