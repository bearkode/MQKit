/*
 *  MQPubAckMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPubAckMessage.h"


@implementation MQPubAckMessage


#pragma mark init/dealloc


+ (instancetype)messageWithMessageID:(UInt16)aMessageID
{
    id sResult = [[[self alloc] init] autorelease];
    
    [sResult setMessageID:aMessageID];
    
    return sResult;
}


#pragma mark - override


+ (MQFixedHeader *)defaultFixedHeader
{
    return [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypePUBACK];
}


+ (MQVariableHeader *)defaultVariableHeader
{
    return [MQMessageIDHeader variableHeader];
}


#pragma mark - public


- (void)setMessageID:(UInt16)aMessageID
{
    [(MQMessageIDHeader *)[self variableHeader] setMessageID:aMessageID];
}


@end
