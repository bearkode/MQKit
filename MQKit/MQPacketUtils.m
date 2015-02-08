/*
 *  MQPacketUtils.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQPacketUtils.h"
#import "NSData+MQAdditions.h"


NSData *MQPacketEncodeRemainingLength(NSInteger aLength)
{
    NSMutableData *sResult = [NSMutableData data];
    UInt8          sDigit  = 0;
    NSInteger      sLength = aLength;
    
    do {
        sDigit  = (UInt8)(sLength % 128);
        sLength = sLength / 128;
        sDigit  = (sLength > 0) ? (sDigit | 0x80) : sDigit;
        
        [sResult appendBytes:&sDigit length:sizeof(UInt8)];
    } while (sLength > 0);
    
    return sResult;
}


NSInteger MQPacketDecodeRemainingLength(NSData *aData, NSInteger *aBytes)
{
    NSInteger sResult     = 0;
    NSInteger sBytes      = 0;
    NSInteger sMultiplier = 1;
    
    for (NSInteger i = 0; i < [aData length]; i++)
    {
        UInt8 sDigit = [aData mqByteAtIndex:i];

        sResult     += (sDigit & 127) * sMultiplier;
        sMultiplier *= 128;

        if ((sDigit & 128) == 0)
        {
            sBytes  = i + 1;
            break;
        }
    }
    
    *aBytes = sBytes;
    
    return sResult;
}