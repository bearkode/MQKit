/*
 *  MQPublishHeaderTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 8..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPublishHeader.h"


@interface MQPublishHeaderTests : XCTestCase


@end


@implementation MQPublishHeaderTests


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
    MQPublishHeader *sHeader = [MQPublishHeader variableHeader];
    
    XCTAssertTrue([[sHeader topicName] isEqualToString:@""], @"");
    XCTAssertTrue([sHeader messageID] == 0, @"");
    
    [sHeader setTopicName:@"testtopic/test"];
    [sHeader setMessageID:100];
    XCTAssertTrue([[sHeader topicName] isEqualToString:@"testtopic/test"], @"");
    XCTAssertTrue([sHeader messageID] == 100, @"");
    
    {
        UInt8   sBytes[] = { 0x00, 0x0e, 't', 'e', 's', 't', 't', 'o', 'p', 'i', 'c', '/', 't', 'e', 's', 't', 0x00, 0x64 };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:18];
        NSData *sDataRep = [sHeader dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
