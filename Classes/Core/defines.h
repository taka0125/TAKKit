//
//  defines.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_defines_h
#define TAKKit_Core_defines_h

#define TAK_RGBACOLOR(c) [UIColor colorWithRed:((c >> 24) & 0xFF) / 255.0 \
                                         green:((c >> 16) & 0xFF) / 255.0 \
                                          blue:((c >> 8) & 0xFF) / 255.0 \
                                         alpha:((c) & 0xFF) / 255.0]

#define TAK_RGBCOLOR(c) [UIColor colorWithRed:((c >> 16) & 0xFF) / 255.0 \
                                        green:((c >> 8) & 0xFF) / 255.0 \
                                         blue:(c & 0xFF) / 255.0 \
                                        alpha:1.0]

#define TAK_IOS_VERSION_EQ(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define TAK_IOS_VERSION_GT(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define TAK_IOS_VERSION_GTE(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define TAK_IOS_VERSION_LT(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define TAK_IOS_VERSION_LTE(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#endif
