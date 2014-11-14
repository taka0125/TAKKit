//
//  TAKUserDefaultsBundleHelper.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKUserDefaultsBundleHelper.h"

@implementation TAKUserDefaultsBundleHelper

+ (NSBundle *)bundle {
  NSString *path = [[NSBundle mainBundle] pathForResource:@"TAKUserDefaults" ofType:@"bundle"];
  return [NSBundle bundleWithPath:path];
}

+ (UIStoryboard *)storyboardWithName:(NSString *)name {
  return [UIStoryboard storyboardWithName:name bundle:[[self class] bundle]];
}

@end
