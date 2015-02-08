/*
 *  MQSubscribeMessage.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessage.h"


@interface MQSubscribeMessage : MQMessage


+ (instancetype)messageWithTopicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel;


- (UInt16)messageID;


- (void)addTopicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel;


@end
