/*
 *  MQConnectPayload.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQConnectPayload.h"
#import "MQPayload+Privates.h"


@implementation MQConnectPayload


@synthesize clientIdentifier = mClientIdentifier;
@synthesize willTopic        = mWillTopic;
@synthesize willMessage      = mWillMessage;
@synthesize userName         = mUserName;
@synthesize password         = mPassword;


#pragma mark init/dealloc


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
    [mClientIdentifier release];
    [mWillTopic release];
    [mWillMessage release];
    [mUserName release];
    [mPassword release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    [[self dataArray] removeAllValues];
    
    [[self dataArray] addString:mClientIdentifier];
    [[self dataArray] addString:mWillTopic];
    [[self dataArray] addString:mWillMessage];
    [[self dataArray] addString:mUserName];
    [[self dataArray] addString:mPassword];
    
    return [super dataRepresentation];
}


@end
