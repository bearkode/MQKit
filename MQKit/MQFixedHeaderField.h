/*
 *  MQFixedHeaderField.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataTypes.h"


typedef struct {
    unsigned char retain_flag : 1;
    unsigned char qos_level : 2;    /*  Quality of Service  */
    unsigned char dup_flag : 1;     /*  Duplicate delivery  */
    unsigned char message_type : 4;
} mq_fixed_header_field_t;


@interface MQFixedHeaderField : NSObject <MQByteRepresentable>
{
    mq_fixed_header_field_t mField;
}


+ (instancetype)fixedHeaderFieldWithMessageType:(MQMessageType)aMessageType;
+ (instancetype)fixedHeaderFieldWithByte:(UInt8)aByte;


- (void)setRetainFlag:(BOOL)aRetainFlag;
- (BOOL)retainFlag;

- (void)setQoSLevel:(MQQoS)aQoSLevel;
- (MQQoS)QoSLevel;

- (void)setDUPFlag:(BOOL)aDUPFlag;
- (BOOL)DUPFlag;

- (MQMessageType)messageType;


@end
