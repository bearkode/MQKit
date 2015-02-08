/*
 *  MQInt8Tests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQInt8.h"
#import "MQUtils.h"


@interface MQInt8Tests : XCTestCase


@end


@implementation MQInt8Tests


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
    MQInt8 *sInt8 = [MQInt8 int8WithByte:0x8F];
    NSData *sData = [sInt8 dataRepresentation];
    
    XCTAssertTrue([sData length] == 1, @"");
    XCTAssertTrue(MQGetByteInData(sData, 0) == 0x8F, @"");
}


- (void)testByteRep
{
    MQInt8 *sInt8 = [MQInt8 int8WithByte:0xD2];
    UInt8   sByte = [sInt8 byteRepresentation];
    
    XCTAssertTrue(sByte == 0xD2, @"");
}


@end
