/*
 *  MQPubRelMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPubRelMessage.h"
#import "MQFixedHeader.h"
#import "MQMessageIDHeader.h"


@interface MQPubRelMessageTests : XCTestCase


@end


@implementation MQPubRelMessageTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testDataRep
{
    MQPubRelMessage *sMessage = [MQPubRelMessage messageWithMessageID:1234];
    NSData          *sDataRep = [sMessage dataRepresentation];
    UInt8            sBytes[] = { 0x62, 0x02, 0x04, 0xd2 };
    NSData          *sDataCmp = [NSData dataWithBytes:sBytes length:4];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypePUBREL, @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQMessageIDHeader class]], @"");
    XCTAssertNil([sMessage payload], @"");
    XCTAssertTrue([sMessage messageID] == 1234, @"");
    XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
}


@end
