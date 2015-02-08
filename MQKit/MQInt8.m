/*
 *  MQInt8.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQInt8.h"


@implementation MQInt8


@synthesize byte = mByte;


#pragma mark - init/dealloc


+ (instancetype)int8WithByte:(UInt8)aByte
{
    return [[[self alloc] initWithByte:aByte] autorelease];
}


- (instancetype)initWithByte:(UInt8)aByte
{
    self = [super init];
    
    if (self)
    {
        mByte = aByte;
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
    return [NSData dataWithBytes:&mByte length:sizeof(UInt8)];
}


- (UInt8)byteRepresentation
{
    return mByte;
}


@end
