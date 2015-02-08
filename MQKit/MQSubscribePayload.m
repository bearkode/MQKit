/*
 *  MQSubscribePayload.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQSubscribePayload.h"
#import "MQPayload+Privates.h"


@implementation MQSubscribePayload


#pragma mark - init/dealloc


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mTopicNames = [[NSMutableArray alloc] init];
        mTopicInfo  = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}


- (void)dealloc
{
    [mTopicNames release];
    [mTopicInfo release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    [[self dataArray] removeAllValues];
    
    for (NSString *sTopicName in mTopicNames)
    {
        unsigned char sQoSLevel = [[mTopicInfo objectForKey:sTopicName] unsignedCharValue];
        
        NSAssert(sQoSLevel, @"");
        
        [[self dataArray] addString:sTopicName];
        [[self dataArray] addUInt8:sQoSLevel];
    }
    
    return [super dataRepresentation];
}


#pragma mark - public


- (void)addTopicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel
{
    NSParameterAssert(aTopicName);
    NSParameterAssert(aQoSLevel <= kMQQoSExactlyOnce);
    
    if (![mTopicInfo objectForKey:aTopicName])
    {
        [mTopicNames addObject:aTopicName];
    }

    [mTopicInfo setObject:[NSNumber numberWithUnsignedChar:aQoSLevel] forKey:aTopicName];
}


- (NSUInteger)countOfTopicName
{
    return [mTopicNames count];
}


@end
