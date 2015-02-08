/*
 *  MQConnectHeader.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 6..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQVariableHeader.h"


@interface MQConnectHeader : MQVariableHeader
{
    NSString       *mProtocolName;
    UInt8           mProtocolVersion;
    MQConnectFlags *mConnectFlags;
    UInt16          mKeepAlive;
}


- (NSString *)protocolName;
- (UInt8)protocolVersion;

- (void)setUserNameFlag:(BOOL)aUserNameFlag;
- (BOOL)userNameFlag;
- (void)setPasswordFlag:(BOOL)aPasswordFlag;
- (BOOL)passwordFlag;
- (void)setWillRetainFlag:(BOOL)aWillRetainFlag;
- (BOOL)willRetainFlag;
- (void)setWillQoS:(MQQoS)aQoS;
- (MQQoS)willQoS;
- (void)setWillFlag:(BOOL)aWillFlag;
- (BOOL)willFlag;
- (void)setCleanSessionFlag:(BOOL)aCleanSessionFlag;
- (BOOL)cleanSessionFlag;

- (void)setKeepAlive:(UInt16)aKeepAlive;
- (UInt16)keepAlive;


@end
