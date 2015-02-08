/*
 *  MQConnAckHeaderTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 8..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQConnAckHeader.h"


@interface MQConnAckHeaderTests : XCTestCase


@end


@implementation MQConnAckHeaderTests


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
    MQConnAckHeader *sHeader = [MQConnAckHeader variableHeader];
    
    XCTAssertTrue([sHeader reserved] == 0x00, @"");
    XCTAssertTrue([sHeader returnCode] == kMQReturnCodeConnectionAccepted, @"");
    
    [sHeader setReturnCode:kMQReturnCodeIdentifierRejected];
    
    {
        UInt8   sBytes[] = { 0x00, 0x02 };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:2];
        NSData *sDataRep = [sHeader dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
