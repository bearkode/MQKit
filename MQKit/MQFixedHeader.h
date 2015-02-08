/*
 *  MQFixedHeader.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataTypes.h"


@interface MQFixedHeader : NSObject <MQDataRepresentable, MQByteRepresentable>
{
    MQFixedHeaderField *mField;
    NSInteger           mRemainingLength;
}


@property (nonatomic, assign) NSInteger remainingLength;


+ (instancetype)fixedHeader;
+ (instancetype)fixedHeaderWithField:(MQFixedHeaderField *)aField remainingLength:(NSInteger)aLength;
+ (instancetype)fixedHeaderWithMessageType:(MQMessageType)aMessageType;


- (MQMessageType)messageType;


- (void)setRetainFlag:(BOOL)aRetainFlag;
- (BOOL)retainFlag;

- (void)setQoSLevel:(MQQoS)aQoSLevel;
- (MQQoS)QoSLevel;

- (void)setDUPFlag:(BOOL)aDUPFlag;
- (BOOL)DUPFlag;


- (UInt8)byteRepresentation;


@end
