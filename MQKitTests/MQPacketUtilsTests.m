/*
 *  MQPacketUtilsTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPacketUtils.h"
#import "NSData+MQAdditions.h"


@interface MQPacketUtilsTests : XCTestCase


@end


@implementation MQPacketUtilsTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testMQPacketEncodeRemainingLength
{
    NSData *sResult = nil;
    
    sResult = MQPacketEncodeRemainingLength(0);
    XCTAssertTrue([sResult length] == 1, @"");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0x00, @"");
    
    sResult = MQPacketEncodeRemainingLength(127);
    XCTAssertTrue([sResult length] == 1, @"");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0x7F, @"");
    
    sResult = MQPacketEncodeRemainingLength(128);
    XCTAssertTrue([sResult length] == 2, @"");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0x80, @"");
    XCTAssertTrue([sResult mqByteAtIndex:1] == 0x01, @"");
    
    sResult = MQPacketEncodeRemainingLength(16383);
    XCTAssertTrue([sResult length] == 2, @"");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0xFF, @"");
    XCTAssertTrue([sResult mqByteAtIndex:1] == 0x7F, @"");
    
    sResult = MQPacketEncodeRemainingLength(16384);
    XCTAssertTrue([sResult length] == 3, "");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0x80, @"");
    XCTAssertTrue([sResult mqByteAtIndex:1] == 0x80, @"");
    XCTAssertTrue([sResult mqByteAtIndex:2] == 0x01, @"");
    
    sResult = MQPacketEncodeRemainingLength(2097151);
    XCTAssertTrue([sResult length] == 3, @"");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0xFF, @"");
    XCTAssertTrue([sResult mqByteAtIndex:1] == 0xFF, @"");
    XCTAssertTrue([sResult mqByteAtIndex:2] == 0x7F, @"");
    
    sResult = MQPacketEncodeRemainingLength(2097152);
    XCTAssertTrue([sResult length] == 4, @"");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0x80, @"");
    XCTAssertTrue([sResult mqByteAtIndex:1] == 0x80, @"");
    XCTAssertTrue([sResult mqByteAtIndex:2] == 0x80, @"");
    XCTAssertTrue([sResult mqByteAtIndex:3] == 0x01, @"");
    
    sResult = MQPacketEncodeRemainingLength(268435455);
    XCTAssertTrue([sResult length] == 4, @"");
    XCTAssertTrue([sResult mqByteAtIndex:0] == 0xFF, @"");
    XCTAssertTrue([sResult mqByteAtIndex:1] == 0xFF, @"");
    XCTAssertTrue([sResult mqByteAtIndex:2] == 0xFF, @"");
    XCTAssertTrue([sResult mqByteAtIndex:3] == 0x7F, @"");
}


- (void)testMQPacketDecodeRemainingLength
{
    NSInteger sResult = 0;
    NSInteger sBytes  = 0;
    
    UInt8 sInputData1[1] = { 0x00 };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData1 length:1], &sBytes);
    XCTAssertTrue(sResult == 0, @"");
    XCTAssertTrue(sBytes == 1, @"");

    UInt8 sInputData2[1] = { 0x7F };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData2 length:1], &sBytes);
    XCTAssertTrue(sResult == 127, @"");
    XCTAssertTrue(sBytes == 1, @"");

    UInt8 sInputData3[2] = { 0x80, 0x01 };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData3 length:2], &sBytes);
    XCTAssertTrue(sResult == 128, @"");
    XCTAssertTrue(sBytes == 2, @"");

    UInt8 sInputData4[2] = { 0xFF, 0x7F };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData4 length:2], &sBytes);
    XCTAssertTrue(sResult == 16383, @"");
    XCTAssertTrue(sBytes == 2, @"");

    UInt8 sInputData5[3] = { 0x80, 0x80, 0x01 };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData5 length:3], &sBytes);
    XCTAssertTrue(sResult == 16384, @"");
    XCTAssertTrue(sBytes == 3, @"");

    UInt8 sInputData6[3] = { 0xFF, 0xFF, 0x7F };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData6 length:3], &sBytes);
    XCTAssertTrue(sResult == 2097151, @"");
    XCTAssertTrue(sBytes == 3, @"");

    UInt8 sInputData7[4] = { 0x80, 0x80, 0x80, 0x01 };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData7 length:4], &sBytes);
    XCTAssertTrue(sResult == 2097152, @"");
    XCTAssertTrue(sBytes == 4, @"");

    UInt8 sInputData8[4] = { 0xFF, 0xFF, 0xFF, 0x7F };
    sResult = MQPacketDecodeRemainingLength([NSData dataWithBytes:sInputData8 length:4], &sBytes);
    XCTAssertTrue(sResult == 268435455, @"");
    XCTAssertTrue(sBytes == 4, @"");
}


@end
