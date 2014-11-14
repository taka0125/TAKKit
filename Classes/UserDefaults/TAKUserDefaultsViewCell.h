//
//  TAKUserDefaultsViewCell.h
//
//  Created by Takahiro Oishi
//  Copyright (c) 2014 Takahiro Oishi. All rights reserved.
//  Released under the MIT license.
//

#import <UIKit/UIKit.h>

@interface TAKUserDefaultsViewCell : UITableViewCell

- (void)bindWithKey:(NSString *)key value:(id)value;

- (CGFloat)calculateHeight;

@end
