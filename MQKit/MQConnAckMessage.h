/*
 *  MQConnAckMessage.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessage.h"


@interface MQConnAckMessage : MQMessage


- (void)setReturnCode:(MQReturnCode)aReturnCode;
- (MQReturnCode)returnCode;

- (BOOL)isSuccess;
- (NSError *)error;


@end
