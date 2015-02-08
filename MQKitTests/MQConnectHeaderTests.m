/*
 *  MQConnectHeaderTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 6..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQConnectHeader.h"


@interface MQConnectHeaderTests : XCTestCase


@end


@implementation MQConnectHeaderTests


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
    MQConnectHeader *sHeader  = [MQConnectHeader variableHeader];
    
    {
        XCTAssertTrue([[sHeader protocolName] isEqualToString:@"MQIsdp"], @"");
        XCTAssertTrue([sHeader protocolVersion] == 3, @"");
    }
    
    {
        UInt8   sCompBytes[] = { 0x00, 0x06, 'M', 'Q', 'I', 's', 'd', 'p', 0x03, 0x00, 0x00, 0x3c };
        NSData *sCompData    = [NSData dataWithBytes:sCompBytes length:12];
        NSData *sDataRep     = [sHeader dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sCompData], @"");
    }
    
    {
        XCTAssertTrue([sHeader userNameFlag] == NO, @"");
        [sHeader setUserNameFlag:YES];
        XCTAssertTrue([sHeader userNameFlag] == YES, @"");

        XCTAssertTrue([sHeader passwordFlag] == NO, @"");
        [sHeader setPasswordFlag:YES];
        XCTAssertTrue([sHeader passwordFlag] == YES, @"");
        
        XCTAssertTrue([sHeader willRetainFlag] == NO, @"");
        [sHeader setWillRetainFlag:YES];
        XCTAssertTrue([sHeader willRetainFlag] == YES, @"");
        
        XCTAssertTrue([sHeader willQoS] == kMQQoSAtMostOnce, @"");
        [sHeader setWillQoS:kMQQoSExactlyOnce];
        XCTAssertTrue([sHeader willQoS] == kMQQoSExactlyOnce, @"");
        
        XCTAssertTrue([sHeader willFlag] == NO, @"");
        [sHeader setWillFlag:YES];
        XCTAssertTrue([sHeader willFlag] == YES, @"");
        
        XCTAssertTrue([sHeader cleanSessionFlag] == NO, @"");
        [sHeader setCleanSessionFlag:YES];
        XCTAssertTrue([sHeader cleanSessionFlag] == YES, @"");
    }
    
    {
        XCTAssertTrue([sHeader keepAlive] == 60, @"");
        [sHeader setKeepAlive:120];
        XCTAssertTrue([sHeader keepAlive] == 120, @"");
    }
    
    {
        UInt8   sCompBytes[] = { 0x00, 0x06, 'M', 'Q', 'I', 's', 'd', 'p', 0x03, 0xf6, 0x00, 0x78 };
        NSData *sCompData    = [NSData dataWithBytes:sCompBytes length:12];
        NSData *sDataRep     = [sHeader dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sCompData], @"");
    }
}


@end
