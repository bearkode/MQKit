/*
 *  MQVariableHeaderTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQVariableHeader.h"
#import "MQUtils.h"


@interface MQVariableHeaderTests : XCTestCase


@end


@implementation MQVariableHeaderTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testPublish
{
    MQVariableHeader *sHeader = [MQVariableHeader variableHeader];
    
    XCTAssertTrue([sHeader isKindOfClass:[MQVariableHeader class]], @"");
}


@end
