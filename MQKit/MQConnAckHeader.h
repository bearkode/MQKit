/*
 *  MQConnAckHeader.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQVariableHeader.h"


typedef NS_ENUM(UInt8, MQReturnCode)
{
    kMQReturnCodeConnectionAccepted = 0x00,
    kMQReturnCodeUnacceptableProtocolVersion = 0x01,
    kMQReturnCodeIdentifierRejected = 0x02,
    kMQReturnCodeServerUnavailable = 0x03,
    kMQReturnCodeBadUsernameOrPassword = 0x04,
    kMQReturnCodeNotAuthorized = 0x05
};


@interface MQConnAckHeader : MQVariableHeader
{
    UInt8        mReserved;
    MQReturnCode mReturnCode;
}


@property (nonatomic, readonly) UInt8        reserved;
@property (nonatomic, assign)   MQReturnCode returnCode;


@end
