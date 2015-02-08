/*
 *  MQFixedHeaderField.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQFixedHeaderField.h"


@implementation MQFixedHeaderField


#pragma mark - init/dealloc


+ (instancetype)fixedHeaderFieldWithMessageType:(MQMessageType)aMessageType
{
    return [[[self alloc] initWithMessageType:aMessageType] autorelease];
}


+ (instancetype)fixedHeaderFieldWithByte:(UInt8)aByte
{
    return [[[self alloc] initWithByte:aByte] autorelease];
}


- (instancetype)initWithHeaderField:(mq_fixed_header_field_t)aHeaderField
{
    self = [super init];
    
    if (self)
    {
        mField = aHeaderField;
    }
    
    return self;
}


- (instancetype)initWithByte:(UInt8)aByte
{
    mq_fixed_header_field_t sHeaderField;
    
    memcpy(&sHeaderField, &aByte, sizeof(mq_fixed_header_field_t));
    
    return [self initWithHeaderField:sHeaderField];
}


- (instancetype)init
{
    return [self initWithMessageType:kMQMessageTypeReserved1];
}


- (instancetype)initWithMessageType:(MQMessageType)aMessageType
{
    mq_fixed_header_field_t sHeaderField;
    
    sHeaderField.message_type = aMessageType;
    sHeaderField.dup_flag = 0;
    sHeaderField.qos_level = 0;
    sHeaderField.retain_flag = 0;

    return [self initWithHeaderField:sHeaderField];
}


- (void)dealloc
{
    [super dealloc];
}


#pragma mark - override


- (UInt8)byteRepresentation
{
    UInt8 sResult = 0x00;
    
    memcpy(&sResult, &mField, sizeof(mq_fixed_header_field_t));
    
    return sResult;
}


#pragma mark - public


- (void)setRetainFlag:(BOOL)aRetainFlag
{
    mField.retain_flag = aRetainFlag;
}


- (BOOL)retainFlag
{
    return mField.retain_flag;
}


- (void)setQoSLevel:(MQQoS)aQoSLevel
{
    mField.qos_level = aQoSLevel;
}


- (MQQoS)QoSLevel
{
    return mField.qos_level;
}


- (void)setDUPFlag:(BOOL)aDUPFlag
{
    mField.dup_flag = aDUPFlag;
}


- (BOOL)DUPFlag
{
    return mField.dup_flag;
}


- (MQMessageType)messageType
{
    return mField.message_type;
}


@end
