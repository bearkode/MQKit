/*
 *  MQConnectMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQConnectMessage.h"


@implementation MQConnectMessage


#pragma mark - init/dealloc


+ (instancetype)messageWithClientIdentifier:(NSString *)aClientIdentifier
{
    id sResult = [[[self alloc] init] autorelease];
    
    [sResult setClientIdentifier:aClientIdentifier];
    
    return sResult;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setPayload:[MQConnectPayload payload]];
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
    MQFixedHeader *sResult = [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypeCONNECT];
    
    [sResult setDUPFlag:NO];
    [sResult setQoSLevel:kMQQoSAtLeastOnce];
    [sResult setRetainFlag:NO];
    
    return sResult;
}


+ (MQVariableHeader *)defaultVariableHeader
{
    MQConnectHeader *sResult = [MQConnectHeader variableHeader];
    
    [sResult setWillQoS:kMQQoSAtLeastOnce];
    [sResult setCleanSessionFlag:YES];
    [sResult setKeepAlive:60];
    
    return sResult;
}


#pragma mark - public


- (void)setClientIdentifier:(NSString *)aClientIdentifier
{
    [(MQConnectPayload *)[self payload] setClientIdentifier:aClientIdentifier];
}


- (NSString *)clientIdentifier
{
    return [(MQConnectPayload *)[self payload] clientIdentifier];
}


@end
