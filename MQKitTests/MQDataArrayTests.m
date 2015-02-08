/*
 *  MQDataArrayTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 6..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQDataArray.h"
#import "MQConnectFlags.h"


@interface MQDataArrayTests : XCTestCase


@end


@implementation MQDataArrayTests


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
    MQDataArray *sDataArray = [[[MQDataArray alloc] init] autorelease];
    
    XCTAssertTrue([sDataArray count] == 0, @"");

    UInt8 sSampleData[] = { 0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff };
    
    [sDataArray addUInt8:0x10];
    [sDataArray addUInt16:0x3333];
    [sDataArray addString:@"Test"];
    [sDataArray addData:[NSData dataWithBytes:sSampleData length:16]];
    [sDataArray addConnectFlags:[MQConnectFlags connectFlags]];
    
    XCTAssertTrue([sDataArray count] == 5);
    XCTAssertTrue([sDataArray uint8AtIndex:0] == 0x10, @"");
    XCTAssertTrue([sDataArray uint16AtIndex:1] == 0x3333, @"");
    XCTAssertTrue([[sDataArray stringAtIndex:2] isEqualToString:@"Test"], @"");
    XCTAssertTrue([[sDataArray dataAtIndex:3] length] == 16, @"");
    XCTAssertTrue([[sDataArray connectFlagsAtIndex:4] isKindOfClass:[MQConnectFlags class]], @"");
    
    UInt8   sCmpByte[] = { 0x10, 0x33, 0x33, 0x00, 0x04, 'T', 'e', 's', 't',
                           0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x00 };
    NSData *sDataRep   = [sDataArray dataRepresentation];
    NSData *sDataCmp   = [NSData dataWithBytes:sCmpByte length:26];
    
    XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    
    [sDataArray removeAllValues];
    XCTAssertTrue([sDataArray count] == 0, @"");
}


@end
