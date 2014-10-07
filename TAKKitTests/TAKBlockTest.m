//
//  TAKBlockTest.m
//
//  Created by Takahiro Oishi
//  Copyright (c) 2014年 Takahiro Ooishi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <TAKKit/TAKKit.h>

@interface TAKBlockTest : XCTestCase
@end

@implementation TAKBlockTest

- (void)testRunOnMainThread {
  XCTestExpectation *expectation = [self expectationWithDescription:@"run on MainThread"];
  
  [TAKBlock runOnMainThread:^{
    XCTAssertTrue([NSThread currentThread].isMainThread);
    [expectation fulfill];
  }];
  
  [self waitForExpectationsWithTimeout:1.0 handler:nil];
}

- (void)testRunInBackground {
  XCTestExpectation *expectation = [self expectationWithDescription:@"run in Background"];
  
  [TAKBlock runInBackground:^{
    XCTAssertFalse([NSThread currentThread].isMainThread);
    [expectation fulfill];
  }];
  
  [self waitForExpectationsWithTimeout:1.0 handler:nil];
}

@end
