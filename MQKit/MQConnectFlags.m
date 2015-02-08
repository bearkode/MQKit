/*
 *  MQConnectFlags.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQConnectFlags.h"


@implementation MQConnectFlags


#pragma mark - init/dealloc


+ (instancetype)connectFlags
{
    return [[[self alloc] init] autorelease];
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        memset(&mField, 0x00, sizeof(mq_connect_flags_t));
    }
    
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


#pragma mark - override


- (UInt8)byteRepresentation
{
    UInt8 sByte = 0x00;
    
    memcpy(&sByte, &mField, sizeof(mq_connect_flags_t));
    
    return sByte;
}


- (NSData *)dataRepresentation
{
    UInt8 sByte = [self byteRepresentation];
    
    return [NSData dataWithBytes:&sByte length:1];
}


#pragma mark - public


- (void)setCleanSessionFlag:(BOOL)aFlag
{
    mField.clean_session = aFlag;
}


- (BOOL)cleanSessionFlag
{
    return mField.clean_session;
}


- (void)setWillFlag:(BOOL)aFlag
{
    mField.will_flag = aFlag;
}


- (BOOL)willFlag
{
    return mField.will_flag;
}


- (void)setWillQoS:(MQQoS)aQoS
{
    mField.will_qos = aQoS;
}


- (MQQoS)willQoS
{
    return mField.will_qos;
}


- (void)setWillRetainFlag:(BOOL)aFlag
{
    mField.will_retain = aFlag;
}


- (BOOL)willRetainFlag
{
    return mField.will_retain;
}


- (void)setPasswordFlag:(BOOL)aFlag
{
    mField.password_flag = aFlag;
}


- (BOOL)passwordFlag
{
    return mField.password_flag;
}


- (void)setUserNameFlag:(BOOL)aFlag
{
    mField.username_flag = aFlag;
}


- (BOOL)userNameFlag
{
    return mField.username_flag;
}


@end
