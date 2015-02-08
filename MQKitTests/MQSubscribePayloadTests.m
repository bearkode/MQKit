/*
 *  MQSubscribePayloadTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 8..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQSubscribePayload.h"


@interface MQSubscribePayloadTests : XCTestCase


@end


@implementation MQSubscribePayloadTests


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
    MQSubscribePayload *sPayload = [MQSubscribePayload payload];

    [sPayload addTopicName:@"Topic/A" QoSLevel:kMQQoSAtMostOnce];
    [sPayload addTopicName:@"Topic/A" QoSLevel:kMQQoSAtLeastOnce];
    [sPayload addTopicName:@"Topic/B" QoSLevel:kMQQoSExactlyOnce];
    
    XCTAssertTrue([sPayload countOfTopicName] == 2, @"");
    
    {
        UInt8   sBytes[] = { 0x00, 0x07, 'T', 'o', 'p', 'i', 'c', '/', 'A', 0x01, 0x00, 0x07, 'T', 'o', 'p', 'i', 'c', '/', 'B', 0x02 };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:20];
        NSData *sDataRep = [sPayload dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
