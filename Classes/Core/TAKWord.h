//
//  TAKWord.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_TAKWord_h
#define TAKKit_Core_TAKWord_h

#import <Foundation/Foundation.h>

@interface TAKWord : NSObject

- (NSString *)localizedString:(NSString *)key;

- (void)setupWords:(NSDictionary *)words;

+ (instancetype)sharedInstance;

@end

#define L(__STR) [[TAKWord sharedInstance] localizedString:__STR]

#endif
