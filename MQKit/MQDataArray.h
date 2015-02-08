/*
 *  MQDataArray.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 6..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataRepresentable.h"


@class MQConnectFlags;


@interface MQDataArray : NSObject <MQDataRepresentable>
{
    NSMutableArray *mItems;
}


- (NSUInteger)count;

- (void)addUInt8:(UInt8)aValue;
- (void)addUInt16:(UInt16)aValue;
- (void)addString:(NSString *)aString;
- (void)addData:(NSData *)aData;
- (void)addConnectFlags:(MQConnectFlags *)aConnectFlags;

- (UInt8)uint8AtIndex:(NSUInteger)aIndex;
- (UInt16)uint16AtIndex:(NSUInteger)aIndex;
- (NSString *)stringAtIndex:(NSUInteger)aIndex;
- (NSData *)dataAtIndex:(NSUInteger)aIndex;
- (MQConnectFlags *)connectFlagsAtIndex:(NSUInteger)aIndex;

- (void)removeAllValues;


@end
