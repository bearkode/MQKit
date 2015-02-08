/*
 *  MQConnAckMessage.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQConnAckMessage.h"
#import "MQMessage+Privates.h"
#import "MQCommon.h"


@implementation MQConnAckMessage


#pragma mark - override


+ (MQFixedHeader *)defaultFixedHeader
{
    MQFixedHeader *sResult = [MQFixedHeader fixedHeaderWithMessageType:kMQMessageTypeCONNACK];
    
    [sResult setDUPFlag:NO];
    [sResult setQoSLevel:kMQQoSAtMostOnce];
    [sResult setRetainFlag:NO];
    
    return sResult;
}


+ (MQVariableHeader *)defaultVariableHeader
{
    return [MQConnAckHeader variableHeader];
}


- (MQVariableHeader *)parseVariableHeaderWithData:(NSData *)aData handledLength:(NSInteger *)aLength
{
    NSParameterAssert([aData length] == 2);
    
    MQConnAckHeader *sHeader = [MQConnAckHeader variableHeader];
    
    [sHeader setReturnCode:[aData mqByteAtIndex:1]];
    
    *aLength = 2;
    
    return sHeader;
}


#pragma mark - public


- (void)setReturnCode:(MQReturnCode)aReturnCode
{
    [(MQConnAckHeader *)[self variableHeader] setReturnCode:aReturnCode];
}


- (MQReturnCode)returnCode
{
    return [(MQConnAckHeader *)[self variableHeader] returnCode];
}


- (BOOL)isSuccess
{
    return ([self returnCode] == kMQReturnCodeConnectionAccepted);
}


- (NSError *)error
{
    NSError *sResult = nil;
    
    if (![self isSuccess])
    {
        sResult = [NSError errorWithDomain:@"MQKitConnectionErrorDomain" code:[self returnCode] userInfo:nil];
    }
    
    return sResult;
}


@end
