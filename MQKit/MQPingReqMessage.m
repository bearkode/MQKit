/*
 *  MQPingReqMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPingReqMessage.h"


@implementation MQPingReqMessage


#pragma mark - init/dealloc


+ (instancetype)message
{
    return [[[self alloc] init] autorelease];
}


#pragma mark - Override


+ (MQFixedHeader *)defaultFixedHeader
{
    return [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypePINGREQ];
}


@end
