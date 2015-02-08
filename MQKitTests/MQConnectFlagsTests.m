/*
 *  MQConnectFlagsTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQConnectFlags.h"


@interface MQConnectFlagsTests : XCTestCase


@end


@implementation MQConnectFlagsTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testConnectFlags
{
    MQConnectFlags *sConnectFlags = nil;
    
    sConnectFlags = [MQConnectFlags connectFlags];
    
    [sConnectFlags setCleanSessionFlag:YES];
    XCTAssertTrue([sConnectFlags cleanSessionFlag] == YES, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x02, @"");
    [sConnectFlags setCleanSessionFlag:NO];
    XCTAssertTrue([sConnectFlags cleanSessionFlag] == NO, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x00, @"");
    
    [sConnectFlags setWillFlag:YES];
    XCTAssertTrue([sConnectFlags willFlag] == YES, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x04, @"");
    [sConnectFlags setWillFlag:NO];
    XCTAssertTrue([sConnectFlags willFlag] == NO, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x00, @"");
    
    [sConnectFlags setWillQoS:kMQQoSReserved];
    XCTAssertTrue([sConnectFlags willQoS] == kMQQoSReserved, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x18, @"");
    [sConnectFlags setWillQoS:kMQQoSAtMostOnce];
    XCTAssertTrue([sConnectFlags willQoS] == kMQQoSAtMostOnce, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x00, @"");
    
    [sConnectFlags setWillRetainFlag:YES];
    XCTAssertTrue([sConnectFlags willRetainFlag] == YES, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x20, @"");
    [sConnectFlags setWillRetainFlag:NO];
    XCTAssertTrue([sConnectFlags willRetainFlag] == NO, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x00, @"");
    
    [sConnectFlags setPasswordFlag:YES];
    XCTAssertTrue([sConnectFlags passwordFlag] == YES, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x40, @"");
    [sConnectFlags setPasswordFlag:NO];
    XCTAssertTrue([sConnectFlags passwordFlag] == NO, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x00, @"");
    
    [sConnectFlags setUserNameFlag:YES];
    XCTAssertTrue([sConnectFlags userNameFlag] == YES, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x80, @"");
    [sConnectFlags setUserNameFlag:NO];
    XCTAssertTrue([sConnectFlags userNameFlag] == NO, @"");
    XCTAssertTrue([sConnectFlags byteRepresentation] == 0x00, @"");
}


@end
