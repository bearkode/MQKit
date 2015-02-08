/*
 *  NEInputBufferedStream.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "NEInputBufferedStream.h"


static const NSInteger kMaxBufferSize = 1024;


@implementation NEInputBufferedStream


- (void)handleDataUsingBlock:(NSInteger (^)(NSData *aData))aBlock
{
    if (!aBlock)
    {
        return;
    }

    NSInteger sHandeledLength = 1;

    while ([mBuffer length] && sHandeledLength)
    {
        sHandeledLength = aBlock(mBuffer);
        
        if (sHandeledLength)
        {
            [mBuffer replaceBytesInRange:NSMakeRange(0, sHandeledLength) withBytes:NULL length:0];
        }
    }
}


- (void)didReceiveStreamEventNone
{
    
}


- (void)didReceiveStreamEventOpenComplete
{
    
}


- (void)didReceiveStreamEventHasBytesAvailable
{
    UInt8      sBuffer[kMaxBufferSize];
    NSUInteger sLength = 0;
    NSData    *sReceivedData = nil;
    
    if ([(NSInputStream *)mStream hasBytesAvailable])
    {
        sLength = [(NSInputStream *)mStream read:sBuffer maxLength:kMaxBufferSize];
        NSLog(@"sLength = %ld", sLength);
        
        if (sLength)
        {
            sReceivedData = [NSData dataWithBytes:sBuffer length:sLength];
            [mBuffer appendData:sReceivedData];
            
            if ([mDelegate respondsToSelector:@selector(bufferedStream:didReceiveData:)])
            {
                [mDelegate bufferedStream:self didReceiveData:sReceivedData];
            }
        }
        else
        {
            NSLog(@"no buffer!");
        }
    }
    else
    {
        NSLog(@"???");
    }
}


- (void)didReceiveStreamEventHasSpaceAvailable
{
    
}


- (void)didReceiveStreamEventErrorOccurred
{
    NSLog(@"didReceiveStreamEventError");
}


- (void)didReceiveStreamEventEndEncountered
{
    NSLog(@"stream event end encountered");

    [self close];
}


@end
