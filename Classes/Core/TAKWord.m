//
//  TAKWord.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKWord.h"

@interface TAKWord ()

@property (nonatomic, copy) NSDictionary *words;

@end

@implementation TAKWord

- (NSString *)localizedString:(NSString *)key {
  NSString *word = self.words[key];
  if (word) return word;
  return NSLocalizedString(key, @"");
}

- (void)setupWords:(NSDictionary *)words {
  self.words = words;
}

+ (instancetype)sharedInstance {
  static TAKWord *_instance = nil;
  static dispatch_once_t oncePredicate;
  dispatch_once(&oncePredicate, ^{
    _instance = [[self alloc] init];
  });
  return _instance;
}

@end
