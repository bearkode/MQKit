/*
 *  MQPubRecMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPubRecMessage.h"


@implementation MQPubRecMessage


#pragma init/dealloc


+ (instancetype)messageWithMessageID:(UInt16)aMessageID
{
    id sResult = [[[self alloc] init] autorelease];
    
    [sResult setMessageID:aMessageID];
    
    return sResult;
}


#pragma mark - override


+ (MQFixedHeader *)defaultFixedHeader
{
    return [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypePUBREC];
}


+ (MQVariableHeader *)defaultVariableHeader
{
    return [MQMessageIDHeader variableHeader];
}


- (MQVariableHeader *)parseVariableHeaderWithData:(NSData *)aData handledLength:(NSInteger *)aLength
{
    MQMessageIDHeader *sResult    = [MQMessageIDHeader variableHeader];
    UInt16             sMessageID = 0;
    
    [aData getBytes:&sMessageID length:sizeof(UInt16)];
    sMessageID = CFSwapInt16BigToHost(sMessageID);
    *aLength   = sizeof(UInt16);
    
    [sResult setMessageID:sMessageID];

    return sResult;
}


#pragma mark - public


- (void)setMessageID:(UInt16)aMessageID
{
    [(MQMessageIDHeader *)[self variableHeader] setMessageID:aMessageID];
}


- (UInt16)messageID
{
    return [(MQMessageIDHeader *)[self variableHeader] messageID];
}


@end
