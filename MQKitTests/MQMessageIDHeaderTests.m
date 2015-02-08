/*
 *  MQMessageIDHeaderTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQMessageIDHeader.h"


@interface MQMessageIDHeaderTests : XCTestCase


@end


@implementation MQMessageIDHeaderTests


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
    MQMessageIDHeader *sHeader = [[[MQMessageIDHeader alloc] init] autorelease];
    
    XCTAssertTrue([sHeader messageID] == 0, @"");
    [sHeader setMessageID:1234];
    XCTAssertTrue([sHeader messageID] == 1234, @"");
    
    {
        UInt8   sBytes[] = { 0x04, 0xd2 };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:2];
        NSData *sDataRep = [sHeader dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
