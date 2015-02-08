/*
 *  MQInt16.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataTypes.h"


@interface MQInt16 : NSObject <MQDataRepresentable>
{
    UInt16 mValue;
}


@property (nonatomic, readonly) UInt16 int16Value;


+ (instancetype)int16WithValue:(UInt16)aValue;


- (instancetype)initWithInt16Value:(UInt16)aValue;


@end
