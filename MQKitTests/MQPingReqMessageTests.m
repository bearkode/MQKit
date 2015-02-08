/*
 *  MQPingReqMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 29..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPingReqMessage.h"
#import "MQCommon.h"


@interface MQPingReqMessageTests : XCTestCase


@end


@implementation MQPingReqMessageTests


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
    MQPingReqMessage *sMessage = [[[MQPingReqMessage alloc] init] autorelease];
    NSData           *sData    = [sMessage dataRepresentation];
    UInt8             sBytes[] = { 0xc0, 0x00 };
    NSData           *sDataCmp = [NSData dataWithBytes:sBytes length:2];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypePINGREQ, @"");
    XCTAssertTrue([sMessage variableHeader] == nil, @"");
    XCTAssertTrue([sMessage payload] == nil, @"");
    XCTAssertTrue([sData isEqualToData:sDataCmp], @"");
}


- (void)testMessage
{
    MQPingReqMessage *sMessage = [MQPingReqMessage message];
    NSData           *sData    = [sMessage dataRepresentation];
    UInt8             sBytes[] = { 0xc0, 0x00 };
    NSData           *sDataCmp = [NSData dataWithBytes:sBytes length:2];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypePINGREQ, @"");
    XCTAssertTrue([sMessage variableHeader] == nil, @"");
    XCTAssertTrue([sMessage payload] == nil, @"");
    XCTAssertTrue([sData isEqualToData:sDataCmp], @"");
}


@end
