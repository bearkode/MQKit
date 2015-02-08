/*
 *  MQPublishPayload.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPublishPayload.h"
#import "MQPayload+Privates.h"


@implementation MQPublishPayload


@synthesize contents = mContents;


#pragma mark - init/dealloc


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
    
    }
    
    return self;
}


- (void)dealloc
{
    [mContents release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    [[self dataArray] removeAllValues];
    
    [[self dataArray] addData:mContents];
    
    return [super dataRepresentation];
}


@end
