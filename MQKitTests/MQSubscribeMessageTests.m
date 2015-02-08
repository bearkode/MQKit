/*
 *  MQSubscribeMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 26..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQSubscribeMessage.h"
#import "MQCommon.h"
#import "MQMessageIDGenerator.h"


@interface MQSubscribeMessageTests : XCTestCase


@end


@implementation MQSubscribeMessageTests


- (void)setUp
{
    [super setUp];
    
    [MQMessageIDGenerator setBaseMessageID:100];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testDataRep
{
    MQSubscribeMessage *sMessage = [[[MQSubscribeMessage alloc] init] autorelease];
    
    [sMessage addTopicName:@"Test/Topic1" QoSLevel:kMQQoSAtLeastOnce];
    [sMessage addTopicName:@"Test/Topic2" QoSLevel:kMQQoSExactlyOnce];
    
    NSData *sPacketData = [sMessage dataRepresentation];
    
    XCTAssertTrue([sPacketData length] == 32, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:0]  == 0x82, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:1]  == 0x1E, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:2]  == 0x00, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:3]  == 0x64, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:4]  == 0x00, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:5]  == 0x0B, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:6]  == 'T', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:7]  == 'e', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:8]  == 's', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:9]  == 't', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:10] == '/', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:11] == 'T', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:12] == 'o', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:13] == 'p', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:14] == 'i', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:15] == 'c', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:16] == '1', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:17] == 0x01, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:18] == 0x00, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:19] == 0x0B, @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:20] == 'T', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:21] == 'e', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:22] == 's', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:23] == 't', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:24] == '/', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:25] == 'T', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:26] == 'o', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:27] == 'p', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:28] == 'i', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:29] == 'c', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:30] == '2', @"");
    XCTAssertTrue([sPacketData mqByteAtIndex:31] == 0x02, @"");
}


- (void)testDataRep2
{
    MQSubscribeMessage *sMessage = [MQSubscribeMessage messageWithTopicName:@"Topic/A" QoSLevel:kMQQoSExactlyOnce];
    NSData             *sDataRep = [sMessage dataRepresentation];
    UInt8               sBytes[] = { 0x82, 0x0c, 0x00, 0x64, 0x00, 0x07, 'T', 'o', 'p', 'i', 'c', '/', 'A', 0x02 };
    NSData             *sDataCmp = [NSData dataWithBytes:sBytes length:14];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] messageType] == kMQMessageTypeSUBSCRIBE, @"");
    XCTAssertTrue([[sMessage fixedHeader] QoSLevel] == kMQQoSAtLeastOnce, @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQMessageIDHeader class]], @"");
    XCTAssertTrue([sMessage messageID] == 100, @"");
    XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
}


@end
