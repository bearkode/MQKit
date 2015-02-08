/*
 *  MQDisconnectMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 29..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQDisconnectMessage.h"
#import "MQCommon.h"


@interface MQDisconnectMessageTests : XCTestCase


@end


@implementation MQDisconnectMessageTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testInit
{
    MQDisconnectMessage *sMessage = [[[MQDisconnectMessage alloc] init] autorelease];
    NSData              *sData    = [sMessage dataRepresentation];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypeDISCONNECT, @"");
    XCTAssertTrue([sMessage variableHeader] == nil, @"");
    XCTAssertTrue([sMessage payload] == nil, @"");
    
    XCTAssertTrue([sData length] == 2, @"");
    XCTAssertTrue([sData mqByteAtIndex:0] == 0xE0, @"");
    XCTAssertTrue([sData mqByteAtIndex:1] == 0x00, @"");
}


- (void)testMessage
{
    MQDisconnectMessage *sMessage = [MQDisconnectMessage message];
    NSData              *sData    = [sMessage dataRepresentation];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypeDISCONNECT, @"");
    XCTAssertTrue([sMessage variableHeader] == nil, @"");
    XCTAssertTrue([sMessage payload] == nil, @"");
    
    XCTAssertTrue([sData length] == 2, @"");
    XCTAssertTrue([sData mqByteAtIndex:0] == 0xE0, @"");
    XCTAssertTrue([sData mqByteAtIndex:1] == 0x00, @"");
}


@end
