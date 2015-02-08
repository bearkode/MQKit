/*
 *  MQTypes.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>


typedef NS_ENUM(UInt8, MQMessageType)
{
    kMQMessageTypeReserved1 = 0,
    kMQMessageTypeCONNECT,
    kMQMessageTypeCONNACK,
    kMQMessageTypePUBLISH,
    kMQMessageTypePUBACK,
    kMQMessageTypePUBREC,
    kMQMessageTypePUBREL,
    kMQMessageTypePUBCOMP,
    kMQMessageTypeSUBSCRIBE,
    kMQMessageTypeSUBACK,
    kMQMessageTypeUNSUBSCRIBE,
    kMQMessageTypeUNSUBACK,
    kMQMessageTypePINGREQ,
    kMQMessageTypePINGRESP,
    kMQMessageTypeDISCONNECT,
    kMQMessageTypeReserved2
};


typedef NS_ENUM(UInt8, MQQoS)
{
    kMQQoSAtMostOnce  = 0x00,
    kMQQoSAtLeastOnce = 0x01,
    kMQQoSExactlyOnce = 0x02,
    kMQQoSReserved    = 0x03
};
