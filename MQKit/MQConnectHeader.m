/*
 *  MQConnectHeader.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 6..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQConnectHeader.h"
#import "MQVariableHeader+Privates.h"


@implementation MQConnectHeader


#pragma mark - init/dealloc


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mProtocolName    = [@"MQIsdp" retain];
        mProtocolVersion = 3;
        mConnectFlags    = [[MQConnectFlags connectFlags] retain];
        mKeepAlive       = 60;
    }
    
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    [[self dataArray] removeAllValues];
    
    [[self dataArray] addString:mProtocolName];
    [[self dataArray] addUInt8:mProtocolVersion];
    [[self dataArray] addConnectFlags:mConnectFlags];
    [[self dataArray] addUInt16:mKeepAlive];
    
    return [super dataRepresentation];
}


#pragma mark - public


- (NSString *)protocolName
{
    return mProtocolName;
}


- (UInt8)protocolVersion
{
    return mProtocolVersion;
}


#pragma mark -


- (void)setUserNameFlag:(BOOL)aUserNameFlag
{
    [mConnectFlags setUserNameFlag:aUserNameFlag];
}


- (BOOL)userNameFlag
{
    return [mConnectFlags userNameFlag];
}


- (void)setPasswordFlag:(BOOL)aPasswordFlag
{
    [mConnectFlags setPasswordFlag:aPasswordFlag];
}


- (BOOL)passwordFlag
{
    return [mConnectFlags passwordFlag];
}


- (void)setWillRetainFlag:(BOOL)aWillRetainFlag
{
    [mConnectFlags setWillRetainFlag:aWillRetainFlag];
}


- (BOOL)willRetainFlag
{
    return [mConnectFlags willRetainFlag];
}


- (void)setWillQoS:(MQQoS)aQoS
{
    [mConnectFlags setWillQoS:aQoS];
}


- (MQQoS)willQoS
{
    return [mConnectFlags willQoS];
}


- (void)setWillFlag:(BOOL)aWillFlag
{
    [mConnectFlags setWillFlag:aWillFlag];
}


- (BOOL)willFlag
{
    return [mConnectFlags willFlag];
}


- (void)setCleanSessionFlag:(BOOL)aCleanSessionFlag
{
    [mConnectFlags setCleanSessionFlag:aCleanSessionFlag];
}


- (BOOL)cleanSessionFlag
{
    return [mConnectFlags cleanSessionFlag];
}


#pragma mark -


- (void)setKeepAlive:(UInt16)aKeepAlive
{
    mKeepAlive = aKeepAlive;
}


- (UInt16)keepAlive
{
    return mKeepAlive;
}


@end
