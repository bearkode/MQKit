/*
 *  MQTTManager.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 10..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQTTManager.h"


@implementation MQTTManager
{
    id               mDelegate;
    NEStreamHandler *mStreamHandler;

}


@synthesize delegate = mDelegate;


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
    
    }
    
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


#pragma mark -


- (void)connectToHost:(NSHost *)aHost port:(NSInteger)aPort
{
    NEStreamHandler *sStreamHandler = [[[NEStreamHandler alloc] initWithHost:aHost port:1883] autorelease];

    [self setStreamHandler:sStreamHandler];
    [self sendMessage:[MQConnectMessage messageWithClientIdentifier:@"MQApp"]];
}


- (void)disconnect
{
    [self sendMessage:[MQDisconnectMessage message]];
    [self setStreamHandler:nil];
}


- (BOOL)isConnected
{
    return (mStreamHandler) ? YES : NO;
}


- (void)ping
{
    [self sendMessage:[MQPingReqMessage message]];
}


- (void)subscribeTopic:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel
{
    [self sendMessage:[MQSubscribeMessage messageWithTopicName:aTopicName QoSLevel:aQoSLevel]];
}


- (void)publishToTopic:(NSString *)aTopicName contents:(NSData *)aContents QoSLevel:(MQQoS)aQoSLevel
{
    [self sendMessage:[MQPublishMessage messageWithContents:aContents topicName:aTopicName QoSLevel:aQoSLevel]];
}


#pragma mark - delegate


- (NSInteger)streamHandler:(NEStreamHandler *)aStreamHandler handleInputData:(NSData *)aData
{
    MQParseResult *sResult  = [MQMessageParser parseData:aData];
    MQMessage     *sMessage = [sResult message];
    
    NSLog(@"receive message = %@", sMessage);
    
    if ([sMessage isKindOfClass:[MQConnAckMessage class]])
    {
        [self didReceiveConnAckMessage:(MQConnAckMessage *)sMessage];
    }
    else if ([sMessage isKindOfClass:[MQPublishMessage class]])
    {
        [self didReceivePublishMessage:(MQPublishMessage *)sMessage];
    }
    else if ([sMessage isKindOfClass:[MQPubRecMessage class]])
    {
        [self didReceivePubRecMessage:(MQPubRecMessage *)sMessage];
    }
    else if ([sMessage isKindOfClass:[MQPubRelMessage class]])
    {
        [self didReceivePubRelMessage:(MQPubRelMessage *)sMessage];
    }
    
    return [sResult handledLength];
}


- (void)didReceiveConnAckMessage:(MQConnAckMessage *)aMessage
{
    if ([mDelegate respondsToSelector:@selector(mqttManager:didConnect:error:)])
    {
        if (![aMessage isSuccess])
        {
            [self disconnect];
        }
        
        [mDelegate mqttManager:self didConnect:[aMessage isSuccess] error:[aMessage error]];
    }
}


- (void)didReceivePublishMessage:(MQPublishMessage *)aMessage
{
    UInt16 sMessageID = [aMessage messageID];

    if ([aMessage QoSLevel] == kMQQoSAtLeastOnce)
    {
        [self sendMessage:[MQPubAckMessage messageWithMessageID:sMessageID]];
    }
    else if ([aMessage QoSLevel] == kMQQoSExactlyOnce)
    {
        [self sendMessage:[MQPubRecMessage messageWithMessageID:sMessageID]];
    }

    if ([mDelegate respondsToSelector:@selector(mqttManager:didReceiveContents:topicName:)])
    {
        [mDelegate mqttManager:self didReceiveContents:[aMessage contents] topicName:[aMessage topicName]];
    }
}


- (void)didReceivePubRecMessage:(MQPubRecMessage *)aMessage
{
    UInt16 sMessageID = [aMessage messageID];
    
    [self sendMessage:[MQPubRelMessage messageWithMessageID:sMessageID]];
}


- (void)didReceivePubRelMessage:(MQPubRelMessage *)aMessage
{
    UInt16 sMessageID = [aMessage messageID];
    
    [self sendMessage:[MQPubCompMessage messageWithMessageID:sMessageID]];
}


#pragma mark - private


- (void)setStreamHandler:(NEStreamHandler *)aStreamHandler
{
    [self willChangeStreamHandler];
    [mStreamHandler autorelease];
    mStreamHandler = [aStreamHandler retain];
    [self didChangeStreamHandler];
}


- (void)willChangeStreamHandler
{
    [mStreamHandler setDelegate:nil];
}


- (void)didChangeStreamHandler
{
    [mStreamHandler setDelegate:self];
}


- (void)sendMessage:(MQMessage *)aMessage
{
    NSParameterAssert(aMessage);
    
    [mStreamHandler writeData:[aMessage dataRepresentation]];
}


@end
