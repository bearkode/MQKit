/*
 *  MQFixedHeaderTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQFixedHeader.h"


@interface MQFixedHeaderTests : XCTestCase


@end


@implementation MQFixedHeaderTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testFixedHeader
{
    MQFixedHeader *sFixedHeader = [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypeCONNACK];
    
    [sFixedHeader setRetainFlag:YES];
    XCTAssertTrue([sFixedHeader retainFlag] == YES, @"");
    XCTAssertTrue([sFixedHeader byteRepresentation] == 0x21, @"");
    [sFixedHeader setRetainFlag:NO];
    XCTAssertTrue([sFixedHeader retainFlag] == NO, @"");
    XCTAssertTrue([sFixedHeader byteRepresentation] == 0x20, @"");
    
    [sFixedHeader setQoSLevel:kMQQoSReserved];
    XCTAssertTrue([sFixedHeader QoSLevel] == kMQQoSReserved, @"");
    XCTAssertTrue([sFixedHeader byteRepresentation] == 0x26, @"");
    [sFixedHeader setQoSLevel:kMQQoSAtMostOnce];
    XCTAssertTrue([sFixedHeader QoSLevel] == kMQQoSAtMostOnce, @"");
    XCTAssertTrue([sFixedHeader byteRepresentation] == 0x20, @"");
    
    [sFixedHeader setDUPFlag:YES];
    XCTAssertTrue([sFixedHeader DUPFlag] == YES, @"");
    XCTAssertTrue([sFixedHeader byteRepresentation] == 0x28, @"");
    [sFixedHeader setDUPFlag:NO];
    XCTAssertTrue([sFixedHeader DUPFlag] == NO, @"");
    XCTAssertTrue([sFixedHeader byteRepresentation] == 0x20, @"");
    
    XCTAssertTrue([sFixedHeader messageType] == kMQMessageTypeCONNACK, @"");
    XCTAssertTrue([sFixedHeader byteRepresentation] == 0x20, @"");
}


- (void)testLength
{
    MQFixedHeader *sFixedHeader = [MQFixedHeader fixedHeader];
    
    XCTAssertTrue([sFixedHeader remainingLength] == 0, @"");
}


@end
