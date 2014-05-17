//
//  UIAlertView+TAKExtensions.h
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#ifndef TAKKit_Core_UIAlertView_TAKExtensions_h
#define TAKKit_Core_UIAlertView_TAKExtensions_h

typedef void (^TAKAlertViewCallback)(NSInteger buttonIndex);

@interface UIAlertView (TAKExtensions) <UIAlertViewDelegate>

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           callback:(TAKAlertViewCallback)callback
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end

#endif
