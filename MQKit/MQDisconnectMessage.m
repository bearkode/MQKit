/*
 *  MQDisconnectMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQDisconnectMessage.h"


@implementation MQDisconnectMessage


#pragma mark - init/dealloc


+ (instancetype)message
{
    return [[[self alloc] init] autorelease];
}


#pragma mark - override


+ (MQFixedHeader *)defaultFixedHeader
{
    return [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypeDISCONNECT];
}


@end
