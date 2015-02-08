/*
 *  MQInt8.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataTypes.h"


@interface MQInt8 : NSObject <MQDataRepresentable, MQByteRepresentable>
{
    UInt8 mByte;
}


@property (nonatomic, readonly) UInt8 byte;


+ (instancetype)int8WithByte:(UInt8)aByte;


- (instancetype)initWithByte:(UInt8)aByte;


@end
