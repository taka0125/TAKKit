//
//  TAKAlert.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKAlert.h"
#import "NSObject+TAKPerformBlock.h"
#import "TAKWord.h"

@implementation TAKAlert

+ (void)showOnMainThreadWithTitle:(NSString *)title message:(NSString *)message {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:L(@"OK") otherButtonTitles:nil];  
  [alert performBlockOnMainThread:^{
    [alert show];
  }];
}

@end
