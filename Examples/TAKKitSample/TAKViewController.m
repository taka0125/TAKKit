//
//  TAKViewController.m
//  TAKKitSample
//
//  Created by Takahiro Ooishi on 2014/05/17.
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//

#import "TAKViewController.h"

@interface TAKViewController ()

@end

@implementation TAKViewController

- (void)viewDidLoad {
  NSLog(@"platform => %@", [UIDevice currentDevice].platform);
}

- (IBAction)showAlert:(id)sender {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test" message:@"Test" callback:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
  [alert show];
}

@end
