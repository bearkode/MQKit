/*
 *  MQPayload.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPayload.h"


@implementation MQPayload


#pragma mark - init/dealloc


+ (instancetype)payload
{
    return [[[self alloc] init] autorelease];
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mDataArray = [[MQDataArray alloc] init];
    }
    
    return self;
}


- (void)dealloc
{
    [mDataArray release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    return [mDataArray dataRepresentation];
}


- (MQDataArray *)dataArray
{
    return mDataArray;
}


@end
