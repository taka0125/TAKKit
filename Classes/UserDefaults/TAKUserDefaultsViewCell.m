//
//  TAKUserDefaultsViewCell.m
//
//  Created by Takahiro Oishi
//  Copyright (c) 2014 Takahiro Oishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKUserDefaultsViewCell.h"

static const CGFloat Padding = 23.0;

@interface TAKUserDefaultsViewCell () 

@property (nonatomic, weak) IBOutlet UILabel *keyNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *classNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *valueLabel;

@end

@implementation TAKUserDefaultsViewCell

- (void)bindWithKey:(NSString *)key value:(id)value {
  self.keyNameLabel.text = key;
  self.classNameLabel.text = NSStringFromClass([value class]);
  self.valueLabel.text = [value description];
  
  CGFloat maxWidth = self.frame.size.width - Padding;
  self.keyNameLabel.preferredMaxLayoutWidth = maxWidth;
  self.classNameLabel.preferredMaxLayoutWidth = maxWidth;
  self.valueLabel.preferredMaxLayoutWidth = maxWidth;
}

- (CGFloat)calculateHeight {
  [self layoutSubviews];
  return [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

@end
