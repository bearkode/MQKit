/*
 *  MQPubAckMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 30..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPubAckMessage.h"


@interface MQPubAckMessageTests : XCTestCase


@end


@implementation MQPubAckMessageTests


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
    MQPubAckMessage *sMessage    = [MQPubAckMessage messageWithMessageID:0x00A8];
    NSData          *sPacketData = [sMessage dataRepresentation];
    UInt8            sByte[]     = { 0x40, 0x02, 0x00, 0xA8 };
    NSData          *sCompData   = [NSData dataWithBytes:sByte length:4];
    
    XCTAssertTrue([sPacketData isEqualToData:sCompData], @"");
}


@end
