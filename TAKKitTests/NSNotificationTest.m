//
//  NSNotificationTest.m
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import <XCTest/XCTest.h>
#import <TAKKit/TAKKit.h>

@interface NSNotificationTest : XCTestCase

@end

@implementation NSNotificationTest

- (void)testParameters {
  NSDictionary *parameters = @{@"key1": @"value1", @"key2": @(2)};
  NSNotification *n = [NSNotification tak_notificationWithName:@"Test" object:nil parameters:parameters];
  XCTAssertEqualObjects([n tak_parameters], parameters, @"");
}

- (void)testParametersWithNil {
  NSDictionary *parameters = nil;
  NSNotification *n = [NSNotification tak_notificationWithName:@"Test" object:nil parameters:parameters];
  XCTAssertNil([n tak_parameters]);
}

@end
