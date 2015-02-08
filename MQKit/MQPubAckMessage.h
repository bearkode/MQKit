/*
 *  MQPubAckMessage.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessage.h"


@interface MQPubAckMessage : MQMessage


+ (instancetype)messageWithMessageID:(UInt16)aMessageID;


- (void)setMessageID:(UInt16)aMessageID;


@end
