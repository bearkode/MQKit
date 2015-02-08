/*
 *  MQMessage.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQPacket.h"


@interface MQMessage : NSObject <MQDataRepresentable>
{
    MQFixedHeader    *mFixedHeader;
    MQVariableHeader *mVariableHeader;
    MQPayload        *mPayload;
}


@property (nonatomic, readonly) MQFixedHeader    *fixedHeader;
@property (nonatomic, readonly) MQVariableHeader *variableHeader;
@property (nonatomic, retain)   MQPayload        *payload;


+ (instancetype)messageWithFixedHeader:(MQFixedHeader *)aFixedHeader packetData:(NSData *)aPacketData;


/*  Override  */
+ (MQFixedHeader *)defaultFixedHeader;
+ (MQVariableHeader *)defaultVariableHeader;


- (MQVariableHeader *)parseVariableHeaderWithData:(NSData *)aData handledLength:(NSInteger *)aLength;
- (MQPayload *)parsePayloadWithData:(NSData *)aData;


@end

