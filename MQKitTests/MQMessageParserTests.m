/*
 *  MQMessageParserTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 25..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQMessages.h"
#import "MQParser.h"


@interface MQMessageParserTests : XCTestCase


@end


@implementation MQMessageParserTests


- (void)setUp
{
    [super setUp];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testConnAckMessage
{
    {
        UInt8          sPacket[6] = { 0x20, 0x02, 0x00, 0x05, 0x33, 0x21 };
        MQParseResult *sResult    = [MQMessageParser parseData:[NSData dataWithBytes:sPacket length:6]];
        
        XCTAssertTrue([[sResult message] isKindOfClass:[MQConnAckMessage class]], @"");
        XCTAssertTrue([sResult handledLength] == 4, @"");
        
        MQConnAckMessage *sConnAckMessage = (MQConnAckMessage *)[sResult message];
        XCTAssertTrue([[sConnAckMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
        XCTAssertTrue([[sConnAckMessage fixedHeader] messageType] == kMQMessageTypeCONNACK, @"");
        XCTAssertTrue([[sConnAckMessage fixedHeader] remainingLength] == 2, @"");
        XCTAssertTrue([[sConnAckMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
        XCTAssertTrue([sConnAckMessage returnCode] == kMQReturnCodeNotAuthorized, @"");
        XCTAssertFalse([sConnAckMessage isSuccess], @"");
        
        NSError *sError = [sConnAckMessage error];
        XCTAssertTrue([sError isKindOfClass:[NSError class]], @"");
        XCTAssertTrue([sError code] == kMQReturnCodeNotAuthorized, @"");
        XCTAssertTrue([[sError domain] isEqualToString:@"MQKitConnectionErrorDomain"], @"");
    }
    
    {
        UInt8          sPacket[6] = { 0x20, 0x02, 0x00, 0x00, 0x33, 0x21 };
        MQParseResult *sResult    = [MQMessageParser parseData:[NSData dataWithBytes:sPacket length:6]];
        
        XCTAssertTrue([[sResult message] isKindOfClass:[MQConnAckMessage class]], @"");
        XCTAssertTrue([sResult handledLength] == 4, @"");
        
        MQConnAckMessage *sConnAckMessage = (MQConnAckMessage *)[sResult message];
        XCTAssertTrue([[sConnAckMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
        XCTAssertTrue([[sConnAckMessage fixedHeader] messageType] == kMQMessageTypeCONNACK, @"");
        XCTAssertTrue([[sConnAckMessage fixedHeader] remainingLength] == 2, @"");
        XCTAssertTrue([[sConnAckMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
        XCTAssertTrue([sConnAckMessage returnCode] == kMQReturnCodeConnectionAccepted, @"");
        XCTAssertTrue([sConnAckMessage isSuccess], @"");
        XCTAssertNil([sConnAckMessage error]);
    }
}


- (void)testPublishMessage
{
    UInt8 sPacket[] = { 0x30, 0x18, 0x00, 0x0E, 0x74, 0x65, 0x73, 0x74, 0x74, 0x6F,
                        0x70, 0x69, 0x63, 0x2F, 0x74, 0x65, 0x73, 0x74, 0x61, 0x73,
                        0x64, 0x66, 0x61, 0x73, 0x64, 0x66 };
    MQParseResult *sResult = [MQMessageParser parseData:[NSData dataWithBytes:sPacket length:26]];
    
    XCTAssertTrue([[sResult message] isKindOfClass:[MQPublishMessage class]], @"");
    XCTAssertTrue([sResult handledLength] == 26, @"");
    
    MQPublishMessage *sMessage = (MQPublishMessage *)[sResult message];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sMessage fixedHeader] QoSLevel] == kMQQoSAtMostOnce, @"");
    
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
    XCTAssertTrue([[sMessage topicName] isEqualToString:@"testtopic/test"], @"");
    XCTAssertTrue([sMessage messageID] == 0, @"");
    NSLog(@"topicName = %@", [sMessage topicName]);
    
    XCTAssertTrue([[sMessage payload] isKindOfClass:[MQPublishPayload class]], @"");
    NSString *sPayload = [[[NSString alloc] initWithData:[sMessage contents] encoding:NSUTF8StringEncoding] autorelease];
    XCTAssertTrue([sPayload isEqualToString:@"asdfasdf"], @"");
}


- (void)testPublishMessageQoSL1
{
    UInt8 sPacket[] = { 0x32, 0x1A, 0x00, 0x0E, 0x74, 0x65, 0x73, 0x74, 0x74, 0x6F,
                        0x70, 0x69, 0x63, 0x2F, 0x74, 0x65, 0x73, 0x74, 0x00, 0x01,
                        0x61, 0x73, 0x64, 0x66, 0x61, 0x73, 0x64, 0x66 };

    MQParseResult *sResult = [MQMessageParser parseData:[NSData dataWithBytes:sPacket length:28]];
    
    XCTAssertTrue([[sResult message] isKindOfClass:[MQPublishMessage class]], @"");
    XCTAssertTrue([sResult handledLength] == 28, @"");
    
    MQPublishMessage *sMessage = (MQPublishMessage *)[sResult message];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([sMessage QoSLevel] == kMQQoSAtLeastOnce, @"");
    
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
    XCTAssertTrue([[sMessage topicName] isEqualToString:@"testtopic/test"], @"");
    NSLog(@"topicName = %@", [sMessage topicName]);
    
    XCTAssertTrue([[sMessage payload] isKindOfClass:[MQPublishPayload class]], @"");
    NSString *sPayload = [[[NSString alloc] initWithData:[sMessage contents] encoding:NSUTF8StringEncoding] autorelease];
    XCTAssertTrue([sPayload isEqualToString:@"asdfasdf"], @"");
}


- (void)testPublishMessageQoSL2
{
    UInt8 sPacket[] = { 0x3C, 0x1C, 0x00, 0x0E, 0x74, 0x65, 0x73, 0x74, 0x74, 0x6F,
                        0x70, 0x69, 0x63, 0x2F, 0x74, 0x65, 0x73, 0x74, 0x00, 0x01,
                        0x61, 0x73, 0x64, 0x66, 0x61, 0x73, 0x64, 0x66, 0x64, 0x64 };

    MQParseResult *sResult = [MQMessageParser parseData:[NSData dataWithBytes:sPacket length:30]];
    
    XCTAssertTrue([[sResult message] isKindOfClass:[MQPublishMessage class]], @"");
    XCTAssertTrue([sResult handledLength] == 30, @"");
    
    MQPublishMessage *sMessage = (MQPublishMessage *)[sResult message];
    
    XCTAssertTrue([[sMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([sMessage QoSLevel] == kMQQoSExactlyOnce, @"");
    
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
    XCTAssertTrue([[sMessage topicName] isEqualToString:@"testtopic/test"], @"");
    XCTAssertTrue([sMessage messageID] == 1, @"");
    NSLog(@"topicName = %@", [sMessage topicName]);
    
    XCTAssertTrue([[sMessage payload] isKindOfClass:[MQPublishPayload class]], @"");
    NSString *sPayload = [[[NSString alloc] initWithData:[sMessage contents] encoding:NSUTF8StringEncoding] autorelease];
    XCTAssertTrue([sPayload isEqualToString:@"asdfasdfdd"], @"");
}


- (void)testPubRecMessage
{
    UInt8   sByte[] = { 0x50, 0x02, 0x00, 0xA8 };
    NSData *sData   = [NSData dataWithBytes:sByte length:4];
    
    MQParseResult *sResult = [MQMessageParser parseData:sData];
    
    XCTAssertTrue([[sResult message] isKindOfClass:[MQPubRecMessage class]], @"");
    XCTAssertTrue([sResult handledLength] == 4, @"");

    MQPubRecMessage *sMessage = (MQPubRecMessage *)[sResult message];
    
    XCTAssertTrue([[sMessage fixedHeader] QoSLevel] == kMQQoSAtMostOnce, @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
    XCTAssertTrue([sMessage messageID] == 0xA8, @"");
}


- (void)testPubRelMessage
{
    UInt8 sPacket[] = { 0x62, 0x02, 0x00, 0x01 };
    
    MQParseResult *sResult = [MQMessageParser parseData:[NSData dataWithBytes:sPacket length:4]];
    
    XCTAssertTrue([[sResult message] isKindOfClass:[MQPubRelMessage class]], @"");
    XCTAssertTrue([sResult handledLength] == 4, @"");
    
    MQPubRelMessage *sMessage = (MQPubRelMessage *)[sResult message];
    
    XCTAssertTrue([[sMessage fixedHeader] QoSLevel] == kMQQoSAtLeastOnce, @"");
    XCTAssertTrue([[sMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
    XCTAssertTrue([sMessage messageID] == 1, @"");
}


- (void)testSubAckMessage
{
    UInt8          sPacket[] = { 0x90, 0x04, 0x03, 0xe8, 0x01, 0x02 };
    NSData        *sData     = [NSData dataWithBytes:sPacket length:6];
    MQParseResult *sResult   = [MQMessageParser parseData:sData];
    
    XCTAssertTrue([[sResult message] isKindOfClass:[MQSubAckMessage class]], @"");
    XCTAssertTrue([sResult handledLength] == 6, @"");
    
    MQSubAckMessage *sSubAckMessage = (MQSubAckMessage *)[sResult message];
    XCTAssertTrue([[sSubAckMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sSubAckMessage fixedHeader] messageType] == kMQMessageTypeSUBACK, @"");
    XCTAssertTrue([[sSubAckMessage fixedHeader] remainingLength] == 4, @"");
    
    XCTAssertTrue([[sSubAckMessage variableHeader] isKindOfClass:[MQVariableHeader class]], @"");
    XCTAssertTrue([sSubAckMessage messageID] == 1000, @"");
    
    XCTAssertTrue([[sSubAckMessage payload] isKindOfClass:[MQPayload class]], @"");
    XCTAssertTrue([sSubAckMessage countOfQoSLevel] == 2, @"");
    XCTAssertTrue([sSubAckMessage QoSLevelAtIndex:0] == kMQQoSAtLeastOnce, @"");
    XCTAssertTrue([sSubAckMessage QoSLevelAtIndex:1] == kMQQoSExactlyOnce, @"");
}


- (void)testPingRespMessage
{
    UInt8          sPacket[] = { 0xD0, 0x00, 0x01 };
    NSData        *sData     = [NSData dataWithBytes:sPacket length:3];
    MQParseResult *sResult   = [MQMessageParser parseData:sData];

    XCTAssertTrue([[sResult message] isKindOfClass:[MQPingRespMessage class]], @"");
    XCTAssertTrue([sResult handledLength] == 2, @"");
    
    MQPingRespMessage *sPingRespMessage = (MQPingRespMessage *)[sResult message];
    XCTAssertTrue([[sPingRespMessage fixedHeader] isKindOfClass:[MQFixedHeader class]], @"");
    XCTAssertTrue([[sPingRespMessage fixedHeader] messageType] == kMQMessageTypePINGRESP, @"");
    XCTAssertTrue([[sPingRespMessage fixedHeader] remainingLength] == 0, @"");
    
    XCTAssertTrue([sPingRespMessage variableHeader] == nil, @"");
    XCTAssertTrue([sPingRespMessage payload] == nil, @"");
}


- (void)testNilResult
{
    UInt8 sPacket[] = { 0x30, 0x18, 0x00, 0x0E, 0x74, 0x65, 0x73, 0x74, 0x74, 0x6F,
                        0x70, 0x69, 0x63, 0x2F, 0x74, 0x65, 0x73, 0x74, 0x61, 0x73 };
    MQParseResult *sResult = [MQMessageParser parseData:[NSData dataWithBytes:sPacket length:20]];
    
    XCTAssertNil(sResult, @"");
}



@end
