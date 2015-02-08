/*
 *  MQConnAckHeader.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQConnAckHeader.h"
#import "MQVariableHeader+Privates.h"


@implementation MQConnAckHeader


@synthesize reserved   = mReserved;
@synthesize returnCode = mReturnCode;


#pragma mark - init/dealloc


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mReserved   = 0x00;
        mReturnCode = kMQReturnCodeConnectionAccepted;
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
    
    [[self dataArray] addUInt8:mReserved];
    [[self dataArray] addUInt8:mReturnCode];
    
    return [super dataRepresentation];
}


@end
