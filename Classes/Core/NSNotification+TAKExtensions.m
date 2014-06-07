//
//  NSNotification+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "NSNotification+TAKExtensions.h"

static NSString * const Key = @"tak_parameters";

@implementation NSNotification (TAKExtensions)

+ (id)notificationWithName:(NSString *)aName object:(id)anObject parameters:(id)parameters {
  NSDictionary *userInfo = @{Key: parameters};
  return [[self class] notificationWithName:aName object:anObject userInfo:userInfo];
}

- (id)parameters {
  return self.userInfo[Key];
}

@end
