/*
 *  MQConnectPayloadTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQConnectPayload.h"


@interface MQConnectPayloadTests : XCTestCase


@end


@implementation MQConnectPayloadTests


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
    MQConnectPayload *sPayload = [MQConnectPayload payload];
    
    XCTAssertNil([sPayload clientIdentifier], @"");
    [sPayload setClientIdentifier:@"ClientId"];
    XCTAssertTrue([[sPayload clientIdentifier] isEqualToString:@"ClientId"], @"");
    
    XCTAssertNil([sPayload willTopic], @"");
    [sPayload setWillTopic:@"WillTopic"];
    XCTAssertTrue([[sPayload willTopic] isEqualToString:@"WillTopic"], @"");
    
    XCTAssertNil([sPayload willMessage], @"");
    [sPayload setWillMessage:@"WillMessage"];
    XCTAssertTrue([[sPayload willMessage] isEqualToString:@"WillMessage"], @"");
    
    XCTAssertNil([sPayload userName], @"");
    [sPayload setUserName:@"UserName"];
    XCTAssertTrue([[sPayload userName] isEqualToString:@"UserName"], @"");
    
    XCTAssertNil([sPayload password], @"");
    [sPayload setPassword:@"Password"];
    XCTAssertTrue([[sPayload password] isEqualToString:@"Password"], @"");
    
    [sPayload setWillMessage:nil];
    
    {
        UInt8   sBytes[] = { 0x00, 0x08, 'C', 'l', 'i', 'e', 'n', 't', 'I', 'd',
                             0x00, 0x09, 'W', 'i', 'l', 'l', 'T', 'o', 'p', 'i', 'c',
                             0x00, 0x08, 'U', 's', 'e', 'r', 'N', 'a', 'm', 'e',
                             0x00, 0x08, 'P', 'a', 's', 's', 'w', 'o', 'r', 'd' };
        NSData *sDataCmp = [NSData dataWithBytes:sBytes length:41];
        NSData *sDataRep = [sPayload dataRepresentation];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


@end
