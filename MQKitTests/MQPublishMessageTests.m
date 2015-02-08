/*
 *  MQPublishMessageTests.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 26..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "MQPublishMessage.h"
#import "MQDataTypes.h"
#import "MQMessageIDGenerator.h"


@interface MQPublishMessageTests : XCTestCase


@end


@implementation MQPublishMessageTests


- (void)setUp
{
    [super setUp];

    [MQMessageIDGenerator setBaseMessageID:100];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)testBuild
{
    NSData           *sContents  = [@"Hello World! - 1" dataUsingEncoding:NSUTF8StringEncoding];
    NSString         *sTopicName = @"SimpleMessage/TestTopic";
    MQPublishMessage *sMessage   = [MQPublishMessage messageWithContents:sContents topicName:sTopicName QoSLevel:kMQQoSAtMostOnce];
    NSData           *sDataRep   = [sMessage dataRepresentation];
    
    XCTAssertTrue([[sMessage contents] isEqualToData:[@"Hello World! - 1" dataUsingEncoding:NSUTF8StringEncoding]], @"");

    {
        UInt8   sByte[]  = { 0x30, 0x29, 0x00, 0x17, 'S',  'i',  'm',  'p',  'l',  'e',
                             'M',  'e',  's',  's',  'a',  'g',  'e',  '/',  'T',  'e',
                             's',  't',  'T',  'o',  'p',  'i',  'c',  'H',  'e',  'l',
                             'l',  'o',  ' ',  'W',  'o',  'r',  'l',  'd',  '!',  ' ',
                             '-',  ' ',  '1' };
        NSData *sDataCmp = [NSData dataWithBytes:sByte length:43];
        
        XCTAssertTrue([sDataRep isEqualToData:sDataCmp], @"");
    }
}


- (void)testQoSLevel1
{
    MQPublishMessage *sMessage = [[[MQPublishMessage alloc] init] autorelease];
    
    [sMessage setQoSLevel:kMQQoSAtLeastOnce];
    [sMessage setTopicName:@"Topic/Test"];
    [sMessage setContents:[@"Hello World!" dataUsingEncoding:NSUTF8StringEncoding]];
    
    XCTAssertTrue([[sMessage contents] isEqualToData:[@"Hello World!" dataUsingEncoding:NSUTF8StringEncoding]], @"");
    
    NSData *sPacketData = [sMessage dataRepresentation];
    UInt8   sByte[28]   = { 0x32, 0x1a, 0x00, 0x0a, 'T',  'o',  'p',  'i',  'c',  '/',
                            'T',  'e',  's',  't',  0x00, 0x64,  'H', 'e',  'l',  'l',
                            'o',  ' ',  'W',  'o',  'r',  'l',  'd',  '!'  };
    NSData *sCompData   = [NSData dataWithBytes:sByte length:28];
    
    XCTAssertTrue([sPacketData length] == 28, @"length = %ld", [sPacketData length]);
    XCTAssertTrue([sPacketData isEqualToData:sCompData], @"");
}


@end
