/*
 *  MQPingRespMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPingRespMessage.h"


@implementation MQPingRespMessage


#pragma mark - override


+ (MQFixedHeader *)defaultFixedHeader
{
    return [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypePINGRESP];
}


+ (MQVariableHeader *)defaultVariableHeader
{
    return nil;
}


@end
