/*
 *  MQUtilsTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQUtils.h"


@interface MQUtilsTests : XCTestCase


@end


@implementation MQUtilsTests

- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testMQBinaryStringFromByte
{
    XCTAssertTrue([MQBinaryStringFromByte(0x01) isEqualToString:@"00000001"], @"");
    XCTAssertTrue([MQBinaryStringFromByte(0x83) isEqualToString:@"10000011"], @"");
    XCTAssertTrue([MQBinaryStringFromByte(0xBA) isEqualToString:@"10111010"], @"");
    XCTAssertTrue([MQBinaryStringFromByte(0xFF) isEqualToString:@"11111111"], @"");
}


- (void)testMQEncodedDataFromString
{
    NSData *sResult = nil;

    sResult = MQEncodedDataFromString(@"OTWP");
    XCTAssertTrue([sResult length] == 6, @"");
    XCTAssertTrue(MQGetByteInData(sResult, 0) == 0x00, @"");
    XCTAssertTrue(MQGetByteInData(sResult, 1) == 0x04, @"");
    XCTAssertTrue(MQGetByteInData(sResult, 2) == 0x4F, @"");
    XCTAssertTrue(MQGetByteInData(sResult, 3) == 0x54, @"");
    XCTAssertTrue(MQGetByteInData(sResult, 4) == 0x57, @"");
    XCTAssertTrue(MQGetByteInData(sResult, 5) == 0x50, @"");
}


@end
