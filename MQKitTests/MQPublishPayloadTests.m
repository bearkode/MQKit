/*
 *  MQPublishPayloadTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPublishPayload.h"


@interface MQPublishPayloadTests : XCTestCase


@end


@implementation MQPublishPayloadTests


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
    MQPublishPayload *sPayload = [MQPublishPayload payload];
    
    [sPayload setContents:[@"Hello?" dataUsingEncoding:NSUTF8StringEncoding]];
    XCTAssertTrue([[sPayload contents] isEqualToData:[@"Hello?" dataUsingEncoding:NSUTF8StringEncoding]], @"");
    
    NSData *sDataRep = [sPayload dataRepresentation];
    XCTAssertTrue([sDataRep isEqualToData:[@"Hello?" dataUsingEncoding:NSUTF8StringEncoding]], @"");
}


@end
