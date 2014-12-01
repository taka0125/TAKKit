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
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.estimatedRowHeight = 108.0f;
  
  if (self.navigationController) {
    _topPaddingConstraint.constant = 0.0f;
  }
  
  [_tableView registerClass:[TAKUserDefaultsViewCell class] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  [_tableView registerNib:[TAKUserDefaultsViewCell tak_nibWithBundle:[TAKUserDefaultsBundleHelper bundle]] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  
  [self.searchDisplayController.searchResultsTableView registerClass:[TAKUserDefaultsViewCell class] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  [self.searchDisplayController.searchResultsTableView registerNib:[TAKUserDefaultsViewCell tak_nibWithBundle:[TAKUserDefaultsBundleHelper bundle]] forCellReuseIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
  
  self.cellForHeightCalculate = [_tableView dequeueReusableCellWithIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier]];
}

- (void)viewWillAppear:(BOOL)animated {
  self.items = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
  self.keys = [_items.allKeys sortedArrayUsingSelector:@selector(compare:)];
  self.filteredKeys = _keys;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self p_decideKeys:tableView].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *key = [self p_decideKeys:tableView][indexPath.row];
  id obj = _items[key];
  [_cellForHeightCalculate bindWithKey:key value:obj];
  return [_cellForHeightCalculate calculateHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TAKUserDefaultsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TAKUserDefaultsViewCell tak_defaultIdentifier] forIndexPath:indexPath];
  cell.backgroundColor = tableView.backgroundColor;
  
  NSString *key = [self p_decideKeys:tableView][indexPath.row];
  id obj = _items[key];
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
  self.filteredKeys = [_keys filteredArrayUsingPredicate:predicate];
  return YES;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Private Methods

- (void)p_keyboardWillHide {
  UITableView *tableView = self.searchDisplayController.searchResultsTableView;
  tableView.contentInset = UIEdgeInsetsZero;
  tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

- (NSArray *)p_decideKeys:(UITableView *)tableView {
  if (tableView == self.searchDisplayController.searchResultsTableView) return _filteredKeys;
  return _keys;
}

@end
