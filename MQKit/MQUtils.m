/*
 *  MQUtils.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQUtils.h"


NSString *MQBinaryStringFromByte(UInt8 aByte)
{
    NSMutableString *sResult = [NSMutableString string];
    UInt8            sBit    = 0x80;
    
    for (NSInteger i = 0; i < 8; i++)
    {
        [sResult appendString:((aByte & sBit) == 0x00) ? @"0" : @"1"];
        sBit >>= 1;
    }
    
    return [NSString stringWithString:sResult];
}


UInt8 MQGetByteInData(NSData *aData, NSUInteger aIndex)
{
    UInt8 sResult = 0;
    
    [aData getBytes:&sResult range:NSMakeRange(aIndex, 1)];
    
    return sResult;
}


NSData *MQEncodedDataFromString(NSString *aString)
{
    NSMutableData   *sResult = [NSMutableData data];
    NSData          *sData   = [aString dataUsingEncoding:NSUTF8StringEncoding];
    UInt16           sLength = CFSwapInt16HostToBig((UInt16)[sData length]);
    
    [sResult appendBytes:&sLength length:sizeof(sLength)];
    [sResult appendData:sData];
    
    return sResult;
}


NSString *MQStringFromEncodedData(NSData *aData, UInt16 *aHandledLength)
{
    UInt16    sHandledLength;
    NSString *sResult = nil;
    
    [aData getBytes:&sHandledLength length:sizeof(UInt16)];
    sHandledLength = CFSwapInt16BigToHost(sHandledLength);

    *aHandledLength = sizeof(UInt16) + sHandledLength;
    
    NSData *sSubData = [aData subdataWithRange:NSMakeRange(2, sHandledLength)];
    
    sResult = [[[NSString alloc] initWithData:sSubData encoding:NSUTF8StringEncoding] autorelease];
    
    return sResult;
}