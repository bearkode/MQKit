/*
 *  MQInt16Tests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQInt16.h"
#import "MQUtils.h"


@interface MQInt16Tests : XCTestCase


@end


@implementation MQInt16Tests

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
    MQInt16 *sInt16 = [MQInt16 int16WithValue:30];
    NSData  *sData  = [sInt16 dataRepresentation];
    
    XCTAssertTrue([sData length] == 2, @"");
    XCTAssertTrue(MQGetByteInData(sData, 0) == 0x00, @"");
    XCTAssertTrue(MQGetByteInData(sData, 1) == 0x1e, @"");
}


@end
