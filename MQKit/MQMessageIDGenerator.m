/*
 *  MQMessageIDGenerator.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 8..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessageIDGenerator.h"


static UInt16 gMessageID     = 0;
static UInt16 gLastMessageID = 0;


@implementation MQMessageIDGenerator


#pragma mark - override


+ (void)initialize
{
    gMessageID = 100;
}


#pragma mark - public


+ (void)setBaseMessageID:(UInt16)aBaseID
{
    @synchronized (self)
    {
        gMessageID = (aBaseID - 1);
    }
}


+ (UInt16)generateMessageID
{
    UInt16 sResult = 0;
    
    @synchronized (self)
    {
        gLastMessageID = ++gMessageID;
        sResult = gLastMessageID;
    }
    
    return sResult;
}


+ (UInt16)lastMessageID
{
    UInt16 sResult = 0;
    
    @synchronized (self)
    {
        sResult = gLastMessageID;
    }
    
    return sResult;
}


@end
