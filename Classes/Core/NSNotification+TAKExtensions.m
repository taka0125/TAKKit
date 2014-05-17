//
//  NSNotification+TAKExtensions.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "NSNotification+TAKExtensions.h"

@implementation NSNotification (TAKExtensions)

+ (id)notificationWithName:(NSString *)aName object:(id)anObject parameters:(id)parameters {
  NSDictionary *userInfo = @{@"parameters": parameters};
  return [[self class] notificationWithName:aName object:anObject userInfo:userInfo];
}

- (id)parameters {
  return self.userInfo[@"parameters"];
}

@end
