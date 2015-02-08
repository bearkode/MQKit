/*
 *  NSData+MQAdditions.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "NSData+MQAdditions.h"


@implementation NSData (MQAdditions)


- (UInt8)mqByteAtIndex:(NSUInteger)aIndex
{
    UInt8 sResult = 0x00;
    
    [self getBytes:&sResult range:NSMakeRange(aIndex, 1)];
    
    return sResult;
}


@end
