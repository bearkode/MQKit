/*
 *  MQString.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataTypes.h"


@interface MQString : NSObject <MQDataRepresentable>
{
    NSString *mString;
}


@property (nonatomic, readonly) NSString *stringValue;


+ (instancetype)stringWithString:(NSString *)aString;


- (instancetype)initWithString:(NSString *)aString;


@end
