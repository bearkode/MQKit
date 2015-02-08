/*
 *  MQSubAckPayload.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPayload.h"


@interface MQSubAckPayload : MQPayload
{
    NSMutableArray *mQoSLevelArray;
}


- (void)addQoSLevel:(MQQoS)aQoSLevel;
- (MQQoS)QoSLevelAtIndex:(NSUInteger)aIndex;
- (NSUInteger)countOfQoSLevel;


@end
