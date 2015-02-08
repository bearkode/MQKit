/*
 *  MQPublishHeader.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQVariableHeader.h"


@interface MQPublishHeader : MQVariableHeader
{
    NSString *mTopicName;
    UInt16    mMessageID;
}


@property (nonatomic, retain) NSString *topicName;
@property (nonatomic, assign) UInt16    messageID;


@end
