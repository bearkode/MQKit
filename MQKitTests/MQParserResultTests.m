/*
 *  MQParserResultTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 25..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQMessages.h"
#import "MQParser.h"


@interface MQParserResultTests : XCTestCase


@end


@implementation MQParserResultTests


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
    MQMessage     *sMessage = [[[MQMessage alloc] init] autorelease];
    MQParseResult *sResult  = [MQParseResult parseResultWithMessage:sMessage handledLength:1000];
    
    XCTAssertTrue([sResult message] == sMessage, @"");
    XCTAssertTrue([sResult handledLength] == 1000, @"");
}


@end
