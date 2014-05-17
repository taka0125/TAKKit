//
//  UIActionSheet+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UIActionSheet_TAKExtensions_h
#define TAKKit_Core_UIActionSheet_TAKExtensions_h

typedef void (^TAKActionSheetCallback)(NSInteger buttonIndex);

@interface UIActionSheet (TAKExtensions) <UIActionSheetDelegate>

- (id)initWithTitle:(NSString *)title callback:(TAKActionSheetCallback)callback;

@end

#endif
