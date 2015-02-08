/*
 *  MQMessageIDGeneratorTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 8..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQMessageIDGenerator.h"


@interface MQMessageIDGeneratorTests : XCTestCase


@end


@implementation MQMessageIDGeneratorTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testBasic
{
    [MQMessageIDGenerator setBaseMessageID:100];
    
    XCTAssertTrue([MQMessageIDGenerator generateMessageID] == 100, @"");
    XCTAssertTrue([MQMessageIDGenerator lastMessageID] == 100, @"");
    XCTAssertTrue([MQMessageIDGenerator generateMessageID] == 101, @"");
    XCTAssertTrue([MQMessageIDGenerator lastMessageID] == 101, @"");
    
    [MQMessageIDGenerator setBaseMessageID:100];

    XCTAssertTrue([MQMessageIDGenerator lastMessageID] == 101, @"");
    XCTAssertTrue([MQMessageIDGenerator generateMessageID] == 100, @"");
    XCTAssertTrue([MQMessageIDGenerator lastMessageID] == 100, @"");
    XCTAssertTrue([MQMessageIDGenerator generateMessageID] == 101, @"");
    XCTAssertTrue([MQMessageIDGenerator lastMessageID] == 101, @"");
}


@end
