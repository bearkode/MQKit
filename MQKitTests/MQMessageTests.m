/*
 *  MQMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQMessage.h"


@interface MQMessageTests : XCTestCase


@end


@implementation MQMessageTests


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
    MQMessage *sMessage = [[[MQMessage alloc] init] autorelease];
    
    XCTAssertTrue([sMessage fixedHeader] == nil, @"");
    XCTAssertTrue([sMessage variableHeader] == nil, @"");
    XCTAssertTrue([sMessage payload] == nil, @"");
    
    UInt8     sBytes[3]      = { 0x00, 0x00, 0x00 };
    NSData   *sData          = [NSData dataWithBytes:sBytes length:3];
    NSInteger sHandledLength = 0;
    
    XCTAssertTrue([sMessage parseVariableHeaderWithData:sData handledLength:&sHandledLength] == nil, @"");
    XCTAssertTrue(sHandledLength == 0, @"");
    XCTAssertTrue([sMessage parsePayloadWithData:sData] == nil, @"");
}


- (void)testEmptyMessage
{
    MQMessage *sMessage = [[[MQMessage alloc] init] autorelease];
    NSData    *sData    = [sMessage dataRepresentation];
    
    XCTAssertTrue([sData isKindOfClass:[NSData class]], @"");
    XCTAssertTrue([sData length] == 0, @"");
}


@end
