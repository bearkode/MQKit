/*
 *  MQSubscribePayload.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPayload.h"


@interface MQSubscribePayload : MQPayload
{
    NSMutableArray      *mTopicNames;
    NSMutableDictionary *mTopicInfo;
}


- (void)addTopicName:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel;
- (NSUInteger)countOfTopicName;


@end
