/*
 *  MQSubAckMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQSubAckMessage.h"
#import "MQCommon.h"


@implementation MQSubAckMessage


+ (MQFixedHeader *)defaultFixedHeader
{
    return [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypeSUBACK];
}


+ (MQVariableHeader *)defaultVariableHeader
{
    return [MQMessageIDHeader variableHeader];
}


- (MQVariableHeader *)parseVariableHeaderWithData:(NSData *)aData handledLength:(NSInteger *)aLength
{
    static const NSInteger sLength = 2;
    NSParameterAssert([aData length] >= sLength);
    
    MQMessageIDHeader *sResult = [MQMessageIDHeader variableHeader];
    UInt16             sMessageID;
    
    [aData getBytes:&sMessageID length:sLength];
    sMessageID = CFSwapInt16BigToHost(sMessageID);
    *aLength   = sLength;

    [sResult setMessageID:sMessageID];

    return sResult;
}


- (MQPayload *)parsePayloadWithData:(NSData *)aData
{
    NSParameterAssert([aData length] > 0);
    
    MQSubAckPayload *sPayload = [MQSubAckPayload payload];
    
    for (NSInteger i = 0; i < [aData length]; i++)
    {
        UInt8 sByte = [aData mqByteAtIndex:i];
        [sPayload addQoSLevel:sByte];
    }
    
    return sPayload;
}


#pragma mark -


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setPayload:[MQSubAckPayload payload]];
    }
    
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


#pragma mark -


- (void)setMessageID:(UInt16)aMessageID
{
    [(MQMessageIDHeader *)[self variableHeader] setMessageID:aMessageID];
}


- (UInt16)messageID
{
    return [(MQMessageIDHeader *)[self variableHeader] messageID];
}


#pragma mark -


- (void)addQoSLevel:(MQQoS)aQoSLevel
{
    [(MQSubAckPayload *)[self payload] addQoSLevel:aQoSLevel];
}


- (NSUInteger)countOfQoSLevel
{
    return [(MQSubAckPayload *)[self payload] countOfQoSLevel];
}


- (MQQoS)QoSLevelAtIndex:(NSUInteger)aIndex
{
    return [(MQSubAckPayload *)[self payload] QoSLevelAtIndex:aIndex];
}


@end
