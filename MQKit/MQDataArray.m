/*
 *  MQDataArray.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 6..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQDataArray.h"
#import "MQInt8.h"
#import "MQInt16.h"


@implementation MQDataArray


#pragma mark - init/dealloc


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void)dealloc
{
    [mItems release];
    
    [super dealloc];
}


#pragma mark - override


- (NSData *)dataRepresentation
{
    NSMutableData *sResult = [NSMutableData data];
    
    for (id sObject in mItems)
    {
        if ([sObject conformsToProtocol:@protocol(MQDataRepresentable)])
        {
            NSData *sData = [sObject dataRepresentation];
            NSAssert(sData, @"");
            if (sData)
            {
                [sResult appendData:sData];
            }
        }
        else if ([sObject isKindOfClass:[NSData class]])
        {
            [sResult appendData:(NSData *)sObject];
        }
    }
    
    return sResult;
}


#pragma mark - public


- (NSUInteger)count
{
    return [mItems count];
}


#pragma mark -


- (void)addUInt8:(UInt8)aValue
{
    [mItems addObject:[MQInt8 int8WithByte:aValue]];
}


- (void)addUInt16:(UInt16)aValue
{
    [mItems addObject:[MQInt16 int16WithValue:aValue]];
}


- (void)addString:(NSString *)aString
{
    if (aString)
    {
        [mItems addObject:[MQString stringWithString:aString]];
    }
}


- (void)addData:(NSData *)aData
{
    NSParameterAssert([aData isKindOfClass:[NSData class]]);

    if (aData)
    {
        [mItems addObject:aData];
    }
}


- (void)addConnectFlags:(MQConnectFlags *)aConnectFlags
{
    NSParameterAssert([aConnectFlags isKindOfClass:[MQConnectFlags class]]);

    if (aConnectFlags)
    {
        [mItems addObject:aConnectFlags];
    }
}


#pragma mark -


- (UInt8)uint8AtIndex:(NSUInteger)aIndex
{
    return [[mItems objectAtIndex:aIndex] byte];
}


- (UInt16)uint16AtIndex:(NSUInteger)aIndex
{
    return [[mItems objectAtIndex:aIndex] int16Value];
}


- (NSString *)stringAtIndex:(NSUInteger)aIndex
{
    return [[mItems objectAtIndex:aIndex] stringValue];
}


- (NSData *)dataAtIndex:(NSUInteger)aIndex
{
    return [mItems objectAtIndex:aIndex];
}


- (MQConnectFlags *)connectFlagsAtIndex:(NSUInteger)aIndex
{
    return [mItems objectAtIndex:aIndex];
}


#pragma mark -


- (void)removeAllValues
{
    [mItems removeAllObjects];
}


@end
