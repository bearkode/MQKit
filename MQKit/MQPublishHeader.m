/*
 *  MQPublishHeader.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPublishHeader.h"
#import "MQVariableHeader+Privates.h"


@implementation MQPublishHeader


@synthesize topicName = mTopicName;
@synthesize messageID = mMessageID;


#pragma mark -


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mTopicName = [@"" retain];
        mMessageID = 0;
    }
    
    return self;
}


- (void)dealloc
{
    [mTopicName release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    NSAssert([mTopicName length], @"");
    
    [[self dataArray] removeAllValues];
    
    [[self dataArray] addString:mTopicName];
    if (mMessageID)
    {
        [[self dataArray] addUInt16:mMessageID];
    }
    
    return [super dataRepresentation];
}


@end
