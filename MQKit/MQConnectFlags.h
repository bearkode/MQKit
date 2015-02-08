/*
 *  MQConnectFlags.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataTypes.h"


typedef struct {
    unsigned char reserved : 1;
    unsigned char clean_session : 1;
    unsigned char will_flag : 1;
    unsigned char will_qos : 2;
    unsigned char will_retain : 1;
    unsigned char password_flag : 1;
    unsigned char username_flag : 1;
} mq_connect_flags_t;


@interface MQConnectFlags : NSObject <MQDataRepresentable, MQByteRepresentable>
{
    mq_connect_flags_t mField;
}


+ (instancetype)connectFlags;


- (void)setCleanSessionFlag:(BOOL)aFlag;
- (BOOL)cleanSessionFlag;

- (void)setWillFlag:(BOOL)aFlag;
- (BOOL)willFlag;

- (void)setWillQoS:(MQQoS)aQoS;
- (MQQoS)willQoS;

- (void)setWillRetainFlag:(BOOL)aFlag;
- (BOOL)willRetainFlag;

- (void)setPasswordFlag:(BOOL)aFlag;
- (BOOL)passwordFlag;

- (void)setUserNameFlag:(BOOL)aFlag;
- (BOOL)userNameFlag;


@end
