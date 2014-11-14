//
//  TAKUserDefaultsBundleHelper.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_UserDefaults_TAKUserDefaultsBundleHelper_h
#define TAKKit_UserDefaults_TAKUserDefaultsBundleHelper_h

#import <UIKit/UIKit.h>

@interface TAKUserDefaultsBundleHelper: NSObject

+ (NSBundle *)bundle;

+ (UIStoryboard *)storyboardWithName:(NSString *)name;

@end

#endif
