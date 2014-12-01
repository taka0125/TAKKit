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

@interface TAKUserDefaultsViewController () <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *topPaddingConstraint;
@property (nonatomic, copy) NSDictionary *items;
@property (nonatomic, copy) NSArray *keys;
@property (nonatomic, copy) NSArray *filteredKeys;
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
  
  [self.searchDisplayController.searchResultsTableView registerClass:[TAKUserDefaultsViewCell class] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  [self.searchDisplayController.searchResultsTableView registerNib:[TAKUserDefaultsViewCell tak_nibWithBundle:[TAKUserDefaultsBundleHelper bundle]] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  
  self.cellForHeightCalculate = [self.tableView dequeueReusableCellWithIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
}

- (void)viewWillAppear:(BOOL)animated {
  self.items = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
  self.keys = [self.items.allKeys sortedArrayUsingSelector:@selector(compare:)];
  self.filteredKeys = self.keys;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self decideKeys:tableView].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *key = [self decideKeys:tableView][indexPath.row];
  id obj = self.items[key];
  [self.cellForHeightCalculate bindWithKey:key value:obj];
  return [self.cellForHeightCalculate calculateHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TAKUserDefaultsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier] forIndexPath:indexPath];
  cell.backgroundColor = tableView.backgroundColor;
  
  NSString *key = [self decideKeys:tableView][indexPath.row];
  id obj = self.items[key];
  [cell bindWithKey:key value:obj];
  
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchDisplayDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchString];
  self.filteredKeys = [self.keys filteredArrayUsingPredicate:predicate];
  return YES;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Private Methods

- (void)keyboardWillHide {
  UITableView *tableView = self.searchDisplayController.searchResultsTableView;
  tableView.contentInset = UIEdgeInsetsZero;
  tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

- (NSArray *)decideKeys:(UITableView *)tableView {
  if (tableView == self.searchDisplayController.searchResultsTableView) return self.filteredKeys;
  return self.keys;
}

@end
