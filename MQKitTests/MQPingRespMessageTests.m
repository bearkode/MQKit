/*
 *  MQPingRespMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 29..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPingRespMessage.h"


@interface MQPingRespMessageTests : XCTestCase


@end


@implementation MQPingRespMessageTests


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
    MQPingRespMessage *sMessage = [[[MQPingRespMessage alloc] init] autorelease];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertNil([sMessage variableHeader], @"");
    
    {
        UInt8   sBytes[] = { 0xd0, 0x00 };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:2];
        NSData *sDataRep = [sMessage dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
