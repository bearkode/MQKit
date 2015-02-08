/*
 *  MQConnectMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQConnectMessage.h"


@interface MQConnectMessageTests : XCTestCase


@end


@implementation MQConnectMessageTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testBasic
{
    MQConnectMessage *sMessage = [[[MQConnectMessage alloc] init] autorelease];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQConnectHeader class]], @"");
    XCTAssertTrue([[sMessage payload] isKindOfClass:[MQConnectPayload class]], @"");
   
    UInt8   sBytes[]  = { 0x12, 0x0c, 0x00, 0x06, 0x4d, 0x51, 0x49, 0x73, 0x64, 0x70, 0x03, 0x0a, 0x00, 60 };
    NSData *sData     = [sMessage dataRepresentation];
    NSData *sCompData = [NSData dataWithBytes:sBytes length:14];
    
    XCTAssertTrue([sData isEqualToData:sCompData], @"");
}


- (void)testInitWithClientIdentifier
{
    MQConnectMessage *sMessage = [MQConnectMessage messageWithClientIdentifier:@"TestApp"];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQConnectHeader class]], @"");
    XCTAssertTrue([[sMessage payload] isKindOfClass:[MQConnectPayload class]], @"");
    XCTAssertTrue([[sMessage clientIdentifier] isEqualToString:@"TestApp"], @"");

    NSData *sDataRep = [sMessage dataRepresentation];
    UInt8   sBytes[] = { 0x12, 0x15, 0x00, 0x06, 0x4d, 0x51, 0x49, 0x73, 0x64, 0x70,
                         0x03, 0x0a, 0x00, 60,   0x00, 0x07, 'T',  'e',  's',  't',
                         'A', 'p', 'p' };
    NSData *sDataCmp = [NSData dataWithBytes:sBytes length:23];
    
    XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
}


@end
