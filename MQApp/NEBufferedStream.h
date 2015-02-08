/*
 *  NEBufferedStream.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>


@interface NEBufferedStream : NSObject <NSStreamDelegate>
{
    id             mDelegate;
    NSStream      *mStream;
    NSMutableData *mBuffer;
}


- (instancetype)initWithStream:(NSStream *)aStream delegate:(id)aDelegate;


- (void)open;
- (void)close;


/*  Override  */
- (void)didReceiveStreamEventNone;
- (void)didReceiveStreamEventOpenComplete;
- (void)didReceiveStreamEventHasBytesAvailable;
- (void)didReceiveStreamEventHasSpaceAvailable;
- (void)didReceiveStreamEventErrorOccurred;
- (void)didReceiveStreamEventEndEncountered;


@end


@protocol NEBufferedStreamDelegate <NSObject>

- (void)bufferedStream:(NEBufferedStream *)aBufferedStream didReceiveData:(NSData *)aData;

@end