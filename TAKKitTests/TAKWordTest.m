//
//  TAKWordTest.m
//  TAKKit
//
//  Created by Takahiro Ooishi on 2014/06/08.
//  Copyright (c) 2014年 Takahiro Ooishi. All rights reserved.
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
    [super tearDown];
}

- (void)testSharedInstance {
  XCTAssertEqualObjects([TAKWord sharedInstance], [TAKWord sharedInstance], @"shared instance does not match.");
}

@end
