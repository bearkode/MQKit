/*
 *  MQPublishPayload.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPayload.h"


@interface MQPublishPayload : MQPayload
{
    NSData *mContents;
}


@property (nonatomic, retain) NSData *contents;


@end
