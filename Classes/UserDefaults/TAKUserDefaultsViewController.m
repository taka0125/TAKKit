//
//  TAKUserDefaultsViewController.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "TAKUserDefaultsViewController.h"
#import "TAKUserDefaultsBundleHelper.h"
#import "TAKUserDefaultsViewCell.h"
#import "TAKKit/Core.h"

@interface TAKUserDefaultsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *topPaddingConstraint;
@property (nonatomic, strong) NSDictionary *items;
@property (nonatomic, strong) NSArray *keys;
@property (nonatomic, strong) TAKUserDefaultsViewCell *cellForHeightCalculate;

@end

@implementation TAKUserDefaultsViewController

+ (instancetype)instantiate {
  UIStoryboard *storyboard = [TAKUserDefaultsBundleHelper storyboardWithName:@"TAKUserDefaults"];
  return [storyboard instantiateViewControllerWithIdentifier:@"TAKUserDefaultsViewController"];
}

- (void)viewDidLoad {
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.estimatedRowHeight = 108.0f;
  
  if (self.navigationController) {
    self.topPaddingConstraint.constant = 0.0f;
  }
  
  [self.tableView registerClass:[TAKUserDefaultsViewCell class] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  [self.tableView registerNib:[TAKUserDefaultsViewCell tak_nibWithBundle:[TAKUserDefaultsBundleHelper bundle]] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  
  self.cellForHeightCalculate = [self.tableView dequeueReusableCellWithIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
}

- (void)viewWillAppear:(BOOL)animated {
  self.items = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
  self.keys = self.items.allKeys;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.keys.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *key = self.keys[indexPath.row];
  id obj = self.items[key];
  
  [self.cellForHeightCalculate bindWithKey:key value:obj];
  return [self.cellForHeightCalculate calculateHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TAKUserDefaultsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier] forIndexPath:indexPath];
  
  NSString *key = self.keys[indexPath.row];
  id obj = self.items[key];
  [cell bindWithKey:key value:obj];
  
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
