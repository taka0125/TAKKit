//
//  TAKViewController.m
//  TAKKit
//
//  Created by Takahiro Ooishi on 2014/06/08.
//  Copyright (c) 2014年 Takahiro Ooishi. All rights reserved.
//

#import "TAKViewController.h"
#import <TAKKit/TAKKit.h>

@interface TAKViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TAKViewController

- (void)viewDidLoad {
  NSLog(@"platform => %@", [UIDevice currentDevice].tak_platform);
  
  [TAKBlock runInBackground:^{
    NSLog(@"isMainThread = %d", [NSThread isMainThread]);
    
    [TAKAlert showWithTitle:@"Title" message:@"message"];
    
  } afterDelay:1.0f];
  
  self.view.backgroundColor = [UIColor tak_RGBColor:0xCCCCCC];
  
  [self modifyFrame];
  [self modifyOrigin];
  [self modifySize];
}

- (void)viewWillAppear:(BOOL)animated {
  self.timer = [NSTimer tak_scheduledTimerWithTimeInterval:1.0 block:^{
    NSLog(@"tak_scheduledTimerWithTimeInterval");
  } repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
  [self.timer invalidate];
  self.timer = nil;
}

#pragma MARK - Modify

- (void)modifyFrame {
  UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
  NSLog(@"[modifyFrame] before = %@", NSStringFromCGRect(v.frame));
  [v tak_modifyFrame:^(CGRect f) {
    f.origin.x = 1;
    f.origin.y = 2;
    f.size.width = 3;
    f.size.height = 4;
    return f;
  }];
  NSLog(@"[modifyFrame] after = %@", NSStringFromCGRect(v.frame));
}

- (void)modifyOrigin {
  UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
  NSLog(@"[modifyOrigin] before = %@", NSStringFromCGRect(v.frame));
  [v tak_modifyOrigin:^(CGPoint o) {
    o.x = 1;
    o.y = 2;
    return o;
  }];
  NSLog(@"[modifyOrigin] after = %@", NSStringFromCGRect(v.frame));
}

- (void)modifySize {
  UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
  NSLog(@"[modifySize] before = %@", NSStringFromCGRect(v.frame));
  [v tak_modifySize:^(CGSize s) {
    s.width = 1;
    s.height = 2;
    return s;
  }];
  NSLog(@"[modifySize] after = %@", NSStringFromCGRect(v.frame));
}

@end
