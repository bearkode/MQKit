/*
 *  MQConnectPayload.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPayload.h"


@interface MQConnectPayload : MQPayload
{
    NSString *mClientIdentifier;
    NSString *mWillTopic;
    NSString *mWillMessage;
    NSString *mUserName;
    NSString *mPassword;
}


@property (nonatomic, retain) NSString *clientIdentifier;
@property (nonatomic, retain) NSString *willTopic;
@property (nonatomic, retain) NSString *willMessage;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *password;


@end
