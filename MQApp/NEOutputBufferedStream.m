/*
 *  NEOutputBufferedStream.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "NEOutputBufferedStream.h"


@implementation NEOutputBufferedStream


- (void)writeData:(NSData *)aData
{
    [mBuffer appendData:aData];
    [self writeDataFromBuffer];
}


- (void)writeDataFromBuffer
{
    if ([(NSOutputStream *)mStream hasSpaceAvailable] && [mBuffer length])
    {
        NSInteger sWrittenLength = [(NSOutputStream *)mStream write:[mBuffer bytes] maxLength:[mBuffer length]];
        
        if (sWrittenLength > 0)
        {
            [mBuffer replaceBytesInRange:NSMakeRange(0, sWrittenLength) withBytes:NULL length:0];
        }
    }
}


#pragma mark -


- (void)didReceiveStreamEventNone
{

}


- (void)didReceiveStreamEventOpenComplete
{

}


- (void)didReceiveStreamEventHasBytesAvailable
{

}


- (void)didReceiveStreamEventHasSpaceAvailable
{
    [self writeDataFromBuffer];
}


- (void)didReceiveStreamEventErrorOccurred
{

}


- (void)didReceiveStreamEventEndEncountered
{
    NSData *sNewData = [mStream propertyForKey:NSStreamDataWrittenToMemoryStreamKey];

    if (!sNewData)
    {
        NSLog(@"No data written to memory!");
    }
    else
    {
        //  TODO :
        //  [self processData:newData];
    }

    [self close];
}


@end
