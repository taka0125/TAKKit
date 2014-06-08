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

- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [[TAKWord sharedInstance] setupWords:@{}];
  [super tearDown];
}

- (void)testSharedInstance {
  XCTAssertEqualObjects([TAKWord sharedInstance], [TAKWord sharedInstance], @"shared instance does not match.");
}

- (void)testLocalizedStringIfNotDefined {
  NSString *key = @"Test";
  XCTAssertEqual(key, [[TAKWord sharedInstance] localizedString:key], @"");
}

- (void)testLocalizedStringIfDefined {
  NSString *key = @"Test";
  NSDictionary *words = @{key: @"TestWord"};
  [[TAKWord sharedInstance] setupWords:words];
  XCTAssertEqual(@"TestWord", [[TAKWord sharedInstance] localizedString:key], @"");
}

@end
