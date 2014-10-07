//
//  TAKWordTest.m
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import <XCTest/XCTest.h>
#import <TAKKit/TAKKit.h>

@interface TAKWordTest : XCTestCase
@end

@implementation TAKWordTest

- (void)tearDown {
  [[TAKWord sharedInstance] setupWords:@{}];
}

- (void)testLocalizedStringIfOverrided {
  [[TAKWord sharedInstance] setupWords:@{@"key1": @"value1"}];
  XCTAssertEqualObjects(@"value1", [[TAKWord sharedInstance] localizedString:@"key1"]);
}

- (void)testLocalizedStringIfNotOverrided {
  [[TAKWord sharedInstance] setupWords:@{@"key1": @"value1"}];
  XCTAssertEqualObjects(@"key2", [[TAKWord sharedInstance] localizedString:@"key2"]);
}

- (void)testParameters {
  NSDictionary *parameters = @{@"key1": @"value1", @"key2": @(2)};
  NSNotification *n = [NSNotification tak_notificationWithName:@"Test" object:nil parameters:parameters];
  XCTAssertEqualObjects([n tak_parameters], parameters, @"");
}

@end
