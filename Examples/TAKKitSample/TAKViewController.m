//
//  TAKViewController.m
//  TAKKitSample
//
//  Created by Takahiro Ooishi on 2014/05/17.
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//

#import "TAKViewController.h"

@implementation TAKViewController

- (void)viewDidLoad {
  NSLog(@"platform => %@", [UIDevice currentDevice].tak_platform);
  
  [TAKBlock runInBackground:^{
    NSLog(@"isMainThread = %d", [NSThread isMainThread]);
    
    [TAKAlert showWithTitle:@"Title" message:@"message"];
    
  } afterDelay:1.0f];
  
  self.view.backgroundColor = [UIColor tak_RGBColor:0xCCCCCC];  
}

@end
