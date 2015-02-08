/*
 *  MQConnAckMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 8..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQConnAckMessage.h"


@interface MQConnAckMessageTests : XCTestCase


@end


@implementation MQConnAckMessageTests


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
    MQConnAckMessage *sMessage = [[[MQConnAckMessage alloc] init] autorelease];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQConnAckHeader class]], @"");
    XCTAssertNil([sMessage payload], @"");
    
    XCTAssertTrue([sMessage returnCode] == kMQReturnCodeConnectionAccepted, @"");
    [sMessage setReturnCode:kMQReturnCodeNotAuthorized];
    XCTAssertTrue([sMessage returnCode] == kMQReturnCodeNotAuthorized, @"");
    
    {
        UInt8   sBytes[] = { 0x20, 0x02, 0x00, 0x05 };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:4];
        NSData *sDataRep = [sMessage dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
