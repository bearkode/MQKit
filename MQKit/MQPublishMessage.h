/*
 *  MQPublishMessage.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessage.h"


@interface MQPublishMessage : MQMessage


+ (instancetype)messageWithContents:(NSData *)aContents topicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel;


- (UInt16)messageID;

- (void)setContents:(NSData *)aContents;
- (NSData *)contents;

- (void)setTopicName:(NSString *)aTopicName;
- (NSString *)topicName;

- (void)setQoSLevel:(MQQoS)aQoSLevel;
- (MQQoS)QoSLevel;


@end
