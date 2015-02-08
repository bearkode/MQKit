/*
 *  MQParseResult.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQParseResult.h"


@implementation MQParseResult


@synthesize message       = mMessage;
@synthesize handledLength = mHandledLength;


#pragma mark - init/dealloc


+ (instancetype)parseResultWithMessage:(MQMessage *)aMessage handledLength:(NSInteger)aLength
{
    return [[[self alloc] initWithMessage:aMessage handledLength:aLength] autorelease];
}


- (instancetype)initWithMessage:(MQMessage *)aMessage handledLength:(NSInteger)aLength
{
    self = [super init];
    
    if (self)
    {
        mMessage = [aMessage retain];
        mHandledLength = aLength;
    }
    
    return self;
}


- (void)dealloc
{
    [mMessage release];
    
    [super dealloc];
}


@end
