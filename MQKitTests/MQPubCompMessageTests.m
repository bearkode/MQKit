/*
 *  MQPubCompMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 30..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPubCompMessage.h"


@interface MQPubCompMessageTests : XCTestCase


@end


@implementation MQPubCompMessageTests


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
    MQPubCompMessage *sMessage = [MQPubCompMessage messageWithMessageID:0x0008];
    NSData           *sDataRep = [sMessage dataRepresentation];
    UInt8             sBytes[] = { 0x70, 0x02, 0x00, 0x08 };
    NSData           *sDataCmp = [NSData dataWithBytes:sBytes length:4];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypePUBCOMP, @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQMessageIDHeader class]], @"");
    XCTAssertNil([sMessage payload], @"");
    XCTAssertTrue([sMessage messageID ] == 0x0008, @"");
    XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
}


@end
