/*
 *  MQSubAckMessage.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessage.h"


@interface MQSubAckMessage : MQMessage


- (void)setMessageID:(UInt16)aMessageID;
- (UInt16)messageID;


- (void)addQoSLevel:(MQQoS)aQoSLevel;
- (MQQoS)QoSLevelAtIndex:(NSUInteger)aIndex;
- (NSUInteger)countOfQoSLevel;


@end
