/*
 *  MQPublishMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPublishMessage.h"
#import "MQCommon.h"
#import "MQPacket.h"
#import "MQVariableHeader+Privates.h"
#import "MQMessageIDGenerator.h"


@implementation MQPublishMessage


#pragma mark - init/dealloc


+ (instancetype)messageWithContents:(NSData *)aContents topicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel
{
    id sResult = [[[self alloc] init] autorelease];
    
    [sResult setContents:aContents];
    [sResult setTopicName:aTopicName];
    [sResult setQoSLevel:aQoSLevel];
    
    return sResult;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setPayload:[MQPublishPayload payload]];
    }
    
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


#pragma mark - override


+ (MQFixedHeader *)defaultFixedHeader
{
    MQFixedHeader *sResult = [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypePUBLISH];
    
    [sResult setDUPFlag:NO];
    [sResult setQoSLevel:kMQQoSExactlyOnce];
    [sResult setRetainFlag:NO];
    
    return sResult;
}


+ (MQVariableHeader *)defaultVariableHeader
{
    return [MQPublishHeader variableHeader];
}


- (MQVariableHeader *)parseVariableHeaderWithData:(NSData *)aData handledLength:(NSInteger *)aLength
{
    MQPublishHeader *sResult = [MQPublishHeader variableHeader];
    NSData          *sData           = aData;
    UInt16           sHandledLength  = 0;
    UInt16           sTopicLength    = 0;
    
    {
        NSString *sTopicName = MQStringFromEncodedData(aData, &sTopicLength);
        [sResult setTopicName:sTopicName];
        sHandledLength += sTopicLength;
        sData = [sData subdataWithRange:NSMakeRange(sHandledLength, [sData length] - sHandledLength)];
    }
    
    if ([[self fixedHeader] QoSLevel])
    {
        {
            UInt16 sMessageID = 0;
            
            [sData getBytes:&sMessageID length:sizeof(UInt16)];
            sMessageID = CFSwapInt16BigToHost(sMessageID);
            sHandledLength += sizeof(UInt16);
            
            [sResult setMessageID:sMessageID];
        }
    }
    
    *aLength = sHandledLength;
    
    return sResult;
}


- (MQPayload *)parsePayloadWithData:(NSData *)aData
{
    MQPublishPayload *sPayload = [MQPublishPayload payload];
    
    [sPayload setContents:aData];
    
    return sPayload;
}


#pragma mark - public


- (void)setContents:(NSData *)aContents;
{
    [(MQPublishPayload *)[self payload] setContents:aContents];
}


- (NSData *)contents
{
    return [(MQPublishPayload *)[self payload] contents];
}


- (UInt16)messageID
{
    return [(MQPublishHeader *)[self variableHeader] messageID];
}


- (void)setTopicName:(NSString *)aTopicName
{
    [(MQPublishHeader *)[self variableHeader] setTopicName:aTopicName];
}


- (NSString *)topicName
{
    return [(MQPublishHeader *)[self variableHeader] topicName];
}


- (void)setQoSLevel:(MQQoS)aQoSLevel
{
    [[self fixedHeader] setQoSLevel:aQoSLevel];
    [self didChangeQoSLevel];
}


- (MQQoS)QoSLevel
{
    return [[self fixedHeader] QoSLevel];
}


#pragma mark - private


- (void)didChangeQoSLevel
{
    MQPublishHeader *sHeader = (MQPublishHeader *)[self variableHeader];
    
    if ([self QoSLevel] == kMQQoSAtMostOnce)
    {
        [sHeader setMessageID:0];
    }
    else
    {
        [sHeader setMessageID:[MQMessageIDGenerator generateMessageID]];
    }
}


@end
