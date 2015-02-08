/*
 *  MQSubAckMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 29..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQSubAckMessage.h"


@interface MQSubAckMessageTests : XCTestCase


@end


@implementation MQSubAckMessageTests


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
    MQSubAckMessage *sMessage = [[[MQSubAckMessage alloc] init] autorelease];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQMessageIDHeader class]], @"");
    XCTAssertTrue([[sMessage payload] isKindOfClass:[MQSubAckPayload class]], @"");
    
    [sMessage setMessageID:1000];
    [sMessage addQoSLevel:kMQQoSExactlyOnce];
    [sMessage addQoSLevel:kMQQoSAtLeastOnce];
    
    XCTAssertTrue([sMessage messageID] == 1000, @"");
    XCTAssertTrue([sMessage QoSLevelAtIndex:0] == kMQQoSExactlyOnce, @"");
    XCTAssertTrue([sMessage QoSLevelAtIndex:1] == kMQQoSAtLeastOnce, @"");
    
    {
        UInt8   sBytes[] = { 0x90, 0x04, 0x03, 0xe8, 0x02, 0x01 };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:6];
        NSData *sDataRep = [sMessage dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
