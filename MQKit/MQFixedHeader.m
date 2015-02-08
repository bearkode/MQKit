/*
 *  MQFixedHeader.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQFixedHeader.h"
#import "MQPacketUtils.h"


@implementation MQFixedHeader


@synthesize remainingLength = mRemainingLength;


#pragma mark - init/dealloc


+ (instancetype)fixedHeader
{
    return [[[self alloc] init] autorelease];
}


+ (instancetype)fixedHeaderWithField:(MQFixedHeaderField *)aField remainingLength:(NSInteger)aLength
{
    return [[[self alloc] initWithField:aField remainingLength:aLength] autorelease];
}


+ (instancetype)fixedHeaderWithMessageType:(MQMessageType)aMessageType
{
    return [[[self alloc] initWithMessageType:aMessageType] autorelease];
}


- (instancetype)initWithField:(MQFixedHeaderField *)aField remainingLength:(NSInteger)aLength
{
    self = [super init];
    
    if (self)
    {
        mField           = [aField retain];
        mRemainingLength = aLength;
    }
    
    return self;
}


- (instancetype)init
{
    MQFixedHeaderField *sField = [[[MQFixedHeaderField alloc] init] autorelease];
    
    return [self initWithField:sField remainingLength:0];
}


- (instancetype)initWithMessageType:(MQMessageType)aMessageType
{
    MQFixedHeaderField *sField = [MQFixedHeaderField fixedHeaderFieldWithMessageType:aMessageType];

    return [self initWithField:sField remainingLength:0];
}


- (void)dealloc
{
    [mField release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    NSMutableData *sResult = [NSMutableData data];
    UInt8          sByte = [mField byteRepresentation];
    
    [sResult appendData:[NSData dataWithBytes:&sByte length:sizeof(UInt8)]];
    [sResult appendData:MQPacketEncodeRemainingLength(mRemainingLength)];
    
    return sResult;
}


- (UInt8)byteRepresentation
{
    return [mField byteRepresentation];
}


#pragma mark - public


- (MQMessageType)messageType
{
    return [mField messageType];
}


- (void)setRetainFlag:(BOOL)aRetainFlag
{
    [mField setRetainFlag:aRetainFlag];
}


- (BOOL)retainFlag
{
    return [mField retainFlag];
}


- (void)setQoSLevel:(MQQoS)aQoSLevel
{
    [mField setQoSLevel:aQoSLevel];
}


- (MQQoS)QoSLevel
{
    return [mField QoSLevel];
}


- (void)setDUPFlag:(BOOL)aDUPFlag
{
    [mField setDUPFlag:aDUPFlag];
}


- (BOOL)DUPFlag
{
    return [mField DUPFlag];
}


@end
