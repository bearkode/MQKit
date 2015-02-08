/*
 *  MQMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessage.h"


@implementation MQMessage


@synthesize fixedHeader    = mFixedHeader;
@synthesize variableHeader = mVariableHeader;
@synthesize payload        = mPayload;


#pragma mark - init/dealloc


+ (instancetype)messageWithFixedHeader:(MQFixedHeader *)aFixedHeader packetData:(NSData *)aPacketData
{
    return [[[self alloc] initWithFixedHeader:aFixedHeader packetData:aPacketData] autorelease];
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setFixedHeader:[[self class] defaultFixedHeader]];
        [self setVariableHeader:[[self class] defaultVariableHeader]];
    }
    
    return self;
}


- (instancetype)initWithFixedHeader:(MQFixedHeader *)aFixedHeader packetData:(NSData *)aPacketData
{
    self = [super init];
    
    if (self)
    {
        NSInteger sHandledLength = 0;
        
        mFixedHeader    = [aFixedHeader retain];
        mVariableHeader = [[self parseVariableHeaderWithData:aPacketData handledLength:&sHandledLength] retain];
        mPayload        = [[self parsePayloadWithData:[aPacketData subdataWithRange:NSMakeRange(sHandledLength, [aPacketData length] - sHandledLength)]] retain];
    }
    
    return self;
}


- (void)dealloc
{
    [mFixedHeader release];
    [mVariableHeader release];
    [mPayload release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    NSMutableData *sResult             = [NSMutableData data];
    NSData        *sVariableHeaderData = [mVariableHeader dataRepresentation];
    NSData        *sPayloadData        = [mPayload dataRepresentation];
    
    [mFixedHeader setRemainingLength:[sVariableHeaderData length] + [sPayloadData length]];
    
    [sResult appendData:[mFixedHeader dataRepresentation]];
    [sResult appendData:sVariableHeaderData];
    [sResult appendData:sPayloadData];
    
    return sResult;
}


#pragma mark - public


+ (MQFixedHeader *)defaultFixedHeader
{
    return nil;
}


+ (MQVariableHeader *)defaultVariableHeader
{
    return nil;
}


- (MQVariableHeader *)parseVariableHeaderWithData:(NSData *)aData handledLength:(NSInteger *)aLength
{
    *aLength = 0;
    
    return nil;
}


- (MQPayload *)parsePayloadWithData:(NSData *)aData
{
    return nil;
}


#pragma mark - private


- (void)setFixedHeader:(MQFixedHeader *)aFixedHeader
{
    [mFixedHeader autorelease];
    mFixedHeader = [aFixedHeader retain];
}


- (void)setVariableHeader:(MQVariableHeader *)aVariableHeader
{
    [mVariableHeader autorelease];
    mVariableHeader = [aVariableHeader retain];
}


@end
