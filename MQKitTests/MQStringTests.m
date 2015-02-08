/*
 *  MQStringTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQString.h"
#import "MQUtils.h"


@interface MQStringTests : XCTestCase


@end


@implementation MQStringTests


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
    MQString *sString = [MQString stringWithString:@"Hello"];
    NSData   *sData   = [sString dataRepresentation];
    
    XCTAssertTrue([sData length] == 7, @"");
    XCTAssertTrue(MQGetByteInData(sData, 0) == 0x00, @"");
    XCTAssertTrue(MQGetByteInData(sData, 1) == 0x05, @"");
    XCTAssertTrue(MQGetByteInData(sData, 2) == 'H', @"");
    XCTAssertTrue(MQGetByteInData(sData, 3) == 'e', @"");
    XCTAssertTrue(MQGetByteInData(sData, 4) == 'l', @"");
    XCTAssertTrue(MQGetByteInData(sData, 5) == 'l', @"");
    XCTAssertTrue(MQGetByteInData(sData, 6) == 'o', @"");
}


@end
