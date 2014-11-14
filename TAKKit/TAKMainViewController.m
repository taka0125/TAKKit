//
//  TAKMainViewController.m
//
//  Created by Takahiro Oishi
//  Copyright (c) 2014 Takahiro Oishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKMainViewController.h"
#import <TAKKit/TAKKit.h>

typedef NS_ENUM(NSInteger, Row) {
  RowObjectiveC,
  RowSwift,
  RowUserDefaults
};


@implementation TAKMainViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  if (indexPath.row != RowUserDefaults) return;

  TAKUserDefaultsViewController *c = [TAKUserDefaultsViewController instantiate];
  [self.navigationController pushViewController:c animated:YES];
}


@end
