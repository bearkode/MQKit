/*
 *  MQMessageParser.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessageParser.h"
#import "MQCommon.h"
#import "MQPacket.h"
#import "MQMessages.h"


@implementation MQMessageParser


#pragma mark - public


+ (MQParseResult *)parseData:(NSData *)aData
{
    NSInteger           sBytes;
    MQFixedHeaderField *sHeaderField = [MQFixedHeaderField fixedHeaderFieldWithByte:[aData mqByteAtIndex:0]];
    NSData             *sSubData     = [aData subdataWithRange:NSMakeRange(1, [aData length] - 1)]; //  TODO : 성능 개선이 필요한 부분.
    NSInteger           sLength      = MQPacketDecodeRemainingLength(sSubData, &sBytes);
    
    if ([sSubData length] >= sLength)
    {
#if (0)
        NSLog(@"sSubData     = %@", sSubData);
        NSLog(@"sLength      = %ld", sLength);
        NSLog(@"sBytes       = %ld", sBytes);
        NSLog(@"sMessageType = %d", [sHeaderField messageType]);
#endif
        
        MQFixedHeader *sFixedHeader  = [MQFixedHeader fixedHeaderWithField:sHeaderField remainingLength:sLength];
        NSData        *sPacketData   = [aData subdataWithRange:NSMakeRange(1 + sBytes, sLength)];
        Class          sMessageClass = [self messageClassForFixedHeader:sFixedHeader];
        MQMessage     *sMessage      = [sMessageClass messageWithFixedHeader:sFixedHeader packetData:sPacketData];
        
        return [MQParseResult parseResultWithMessage:sMessage handledLength:(1 + sBytes + [sPacketData length])];
    }
    else
    {
        return nil;
    }
}


#pragma mark - private


+ (Class)messageClassForFixedHeader:(MQFixedHeader *)aFixedHeader
{
    static NSDictionary   *sClassTable = nil;
    static dispatch_once_t sOnceToken;
    
    dispatch_once(&sOnceToken, ^{
        sClassTable = [@{ [NSNumber numberWithUnsignedChar:kMQMessageTypeCONNECT]     : NSStringFromClass([MQConnectMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypeCONNACK]     : NSStringFromClass([MQConnAckMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypePUBLISH]     : NSStringFromClass([MQPublishMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypePUBACK]      : NSStringFromClass([MQPubAckMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypePUBREC]      : NSStringFromClass([MQPubRecMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypePUBREL]      : NSStringFromClass([MQPubRelMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypePUBCOMP]     : NSStringFromClass([MQPubCompMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypeSUBSCRIBE]   : NSStringFromClass([MQSubscribeMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypeSUBACK]      : NSStringFromClass([MQSubAckMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypeUNSUBSCRIBE] : NSStringFromClass([MQUnsubscribeMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypeUNSUBACK]    : NSStringFromClass([MQUnsubAckMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypePINGREQ]     : NSStringFromClass([MQPingReqMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypePINGRESP]    : NSStringFromClass([MQPingRespMessage class]),
                          [NSNumber numberWithUnsignedChar:kMQMessageTypeDISCONNECT]  : NSStringFromClass([MQDisconnectMessage class]) } retain];
    });
    
    return NSClassFromString([sClassTable objectForKey:[NSNumber numberWithUnsignedChar:[aFixedHeader messageType]]]);
}


@end
