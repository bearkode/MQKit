/*
 *  MQVariableHeader.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQVariableHeader.h"


@implementation MQVariableHeader


#pragma mark - init/dealloc


+ (instancetype)variableHeader
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


#pragma mark - privates


- (MQDataArray *)dataArray
{
    return mDataArray;
}


@end
