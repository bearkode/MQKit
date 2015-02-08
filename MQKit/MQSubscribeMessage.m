/*
 *  MQSubscribeMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQSubscribeMessage.h"
#import "MQMessageIDGenerator.h"


@implementation MQSubscribeMessage


#pragma mark - init/dealloc


+ (instancetype)messageWithTopicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel
{
    id sResult = [[[self alloc] init] autorelease];
    
    [sResult addTopicName:aTopicName QoSLevel:aQoSLevel];
    
    return sResult;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setPayload:[MQSubscribePayload payload]];
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
    MQFixedHeader *sResult = [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypeSUBSCRIBE];
    
    [sResult setDUPFlag:NO];
    [sResult setQoSLevel:kMQQoSAtLeastOnce];
    [sResult setRetainFlag:NO];
    
    return sResult;
}


+ (MQVariableHeader *)defaultVariableHeader
{
    MQMessageIDHeader *sResult = [MQMessageIDHeader variableHeader];
    
    [sResult setMessageID:[MQMessageIDGenerator generateMessageID]];
    
    return sResult;
}


#pragma mark - public


- (UInt16)messageID
{
    return [(MQMessageIDHeader *)[self variableHeader] messageID];
}


- (void)addTopicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel
{
    [(MQSubscribePayload *)[self payload] addTopicName:aTopicName QoSLevel:aQoSLevel];
}


@end
