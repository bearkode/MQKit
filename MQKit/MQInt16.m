/*
 *  MQInt16.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQInt16.h"


@implementation MQInt16


@synthesize int16Value = mValue;


#pragma mark - init/dealloc


+ (instancetype)int16WithValue:(UInt16)aValue
{
    return [[[self alloc] initWithInt16Value:aValue] autorelease];
}


- (instancetype)initWithInt16Value:(UInt16)aValue
{
    self = [super init];
    
    if (self)
    {
        mValue = aValue;
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
    UInt16 sValue = CFSwapInt16HostToBig(mValue);
    
    return [NSData dataWithBytes:&sValue length:sizeof(UInt16)];
}


@end
