/*
 *  MQPubRecMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 30..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPubRecMessage.h"


@interface MQPubRecMessageTests : XCTestCase


@end


@implementation MQPubRecMessageTests


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
    MQPubRecMessage *sMessage = [MQPubRecMessage messageWithMessageID:0x00A8];
    NSData          *sDataRep = [sMessage dataRepresentation];
    UInt8            sByte[]  = { 0x50, 0x02, 0x00, 0xA8 };
    NSData          *sDataCmp = [NSData dataWithBytes:sByte length:4];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypePUBREC, @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQMessageIDHeader class]], @"");
    XCTAssertTrue([sMessage messageID] == 0x00A8, @"");
    XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
}


@end
