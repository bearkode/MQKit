/*
 *  MQSubAckPayload.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQSubAckPayload.h"
#import "MQPayload+Privates.h"


@implementation MQSubAckPayload


#pragma mark init/dealloc


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mQoSLevelArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void)dealloc
{
    [mQoSLevelArray release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    [[self dataArray] removeAllValues];
    
    for (NSNumber *sQoSLevel in mQoSLevelArray)
    {
        [[self dataArray] addUInt8:[sQoSLevel unsignedCharValue]];
    }
    
    return [super dataRepresentation];
}


#pragma mark - public


- (void)addQoSLevel:(MQQoS)aQoSLevel
{
    [mQoSLevelArray addObject:[NSNumber numberWithUnsignedChar:aQoSLevel]];
}


- (MQQoS)QoSLevelAtIndex:(NSUInteger)aIndex
{
    return [[mQoSLevelArray objectAtIndex:aIndex] unsignedCharValue];
}


- (NSUInteger)countOfQoSLevel
{
    return [mQoSLevelArray count];
}


@end
