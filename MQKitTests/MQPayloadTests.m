/*
 *  MQPayloadTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPayload.h"
#import "MQPayload+Privates.h"
#import "MQCommon.h"


@interface MQPayloadTests : XCTestCase


@end


@implementation MQPayloadTests


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
    MQPayload *sPayload = [[[MQPayload alloc] init] autorelease];
    NSData    *sData    = [sPayload dataRepresentation];
    
    XCTAssertTrue([sPayload isKindOfClass:[MQPayload class]], @"");
    XCTAssertTrue([sData isKindOfClass:[NSData class]], @"");
    XCTAssertTrue([sData length] == 0, @"");
}


- (void)testAppendString
{
    MQPayload *sPayload = [[[MQPayload alloc] init] autorelease];
    
    [[sPayload dataArray] addString:@"Hello"];
    [[sPayload dataArray] addString:@"World"];
    
    NSData *sData = [sPayload dataRepresentation];
    
    XCTAssertTrue([sData isKindOfClass:[NSData class]], @"");
    XCTAssertTrue([sData length] == 14, @"");
}


- (void)testSubscribePayload
{
    MQPayload *sPayload = [[[MQPayload alloc] init] autorelease];
    [[sPayload dataArray] addString:@"Test/App"];
    [[sPayload dataArray] addUInt8:0x01];
    [[sPayload dataArray] addString:@"Test/Web"];
    [[sPayload dataArray] addUInt8:0x02];
    
    NSData *sData = [sPayload dataRepresentation];
    
    XCTAssertTrue([sData isKindOfClass:[NSData class]], @"");
    XCTAssertTrue([sData length] == 22, @"");
    XCTAssertTrue([sData mqByteAtIndex:0]  == 0x00, @"");
    XCTAssertTrue([sData mqByteAtIndex:1]  == 0x08, @"");
    XCTAssertTrue([sData mqByteAtIndex:2]  == 'T', @"");
    XCTAssertTrue([sData mqByteAtIndex:3]  == 'e', @"");
    XCTAssertTrue([sData mqByteAtIndex:4]  == 's', @"");
    XCTAssertTrue([sData mqByteAtIndex:5]  == 't', @"");
    XCTAssertTrue([sData mqByteAtIndex:6]  == '/', @"");
    XCTAssertTrue([sData mqByteAtIndex:7]  == 'A', @"");
    XCTAssertTrue([sData mqByteAtIndex:8]  == 'p', @"");
    XCTAssertTrue([sData mqByteAtIndex:9]  == 'p', @"");
    XCTAssertTrue([sData mqByteAtIndex:10] == 0x01, @"");
    XCTAssertTrue([sData mqByteAtIndex:11] == 0x00, @"");
    XCTAssertTrue([sData mqByteAtIndex:12] == 0x08, @"");
    XCTAssertTrue([sData mqByteAtIndex:13] == 'T', @"");
    XCTAssertTrue([sData mqByteAtIndex:14] == 'e', @"");
    XCTAssertTrue([sData mqByteAtIndex:15] == 's', @"");
    XCTAssertTrue([sData mqByteAtIndex:16] == 't', @"");
    XCTAssertTrue([sData mqByteAtIndex:17] == '/', @"");
    XCTAssertTrue([sData mqByteAtIndex:18] == 'W', @"");
    XCTAssertTrue([sData mqByteAtIndex:19] == 'e', @"");
    XCTAssertTrue([sData mqByteAtIndex:20] == 'b', @"");
    XCTAssertTrue([sData mqByteAtIndex:21] == 0x02, @"");
}


@end
