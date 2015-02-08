/*
 *  MQString.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQString.h"
#import "MQUtils.h"


@implementation MQString


@synthesize stringValue = mString;


#pragma mark - init/dealloc


+ (instancetype)stringWithString:(NSString *)aString
{
    return [[[self alloc] initWithString:aString] autorelease];
}


- (instancetype)initWithString:(NSString *)aString
{
    self = [super init];
    
    if (self)
    {
        mString = [aString retain];
    }
    
    return self;
}


- (void)dealloc
{
    [mString release];

    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    return MQEncodedDataFromString(mString);
}


@end
