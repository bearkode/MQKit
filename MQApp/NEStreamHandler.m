/*
 *  NEStreamHandler.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "NEStreamHandler.h"
#import "NEInputBufferedStream.h"
#import "NEOutputBufferedStream.h"


@implementation NEStreamHandler
{
    NEInputBufferedStream  *mInputStream;
    NEOutputBufferedStream *mOutputStream;
    
    id                      mDelegate;
}


@synthesize delegate = mDelegate;


- (instancetype)initWithHost:(NSHost *)aHost port:(NSInteger)aPort
{
    self = [super init];
    
    if (self)
    {
        NSInputStream  *sInputStream = nil;
        NSOutputStream *sOutputStream = nil;
        
        [NSStream getStreamsToHost:aHost port:aPort inputStream:&sInputStream outputStream:&sOutputStream];

        mInputStream  = [[NEInputBufferedStream alloc] initWithStream:sInputStream delegate:self];
        mOutputStream = [[NEOutputBufferedStream alloc] initWithStream:sOutputStream delegate:self];
        
        [mInputStream open];
        [mOutputStream open];
    }
    
    return self;
}


- (void)dealloc
{
    [mInputStream release];
    [mOutputStream release];
    
    [super dealloc];
}


#pragma mark -


- (void)writeData:(NSData *)aData
{
    [mOutputStream writeData:aData];
}


#pragma mark -


- (void)bufferedStream:(NEBufferedStream *)aBufferedStream didReceiveData:(NSData *)aData
{
    if ([mDelegate respondsToSelector:@selector(streamHandler:didReceiveData:)])
    {
        [mDelegate streamHandler:self didReceiveData:aData];
    }

    [self handleInputStreamData];
}


- (void)handleInputStreamData
{
    if ([mDelegate respondsToSelector:@selector(streamHandler:handleInputData:)])
    {
        [mInputStream handleDataUsingBlock:^NSInteger(NSData *aData) {
            return [mDelegate streamHandler:self handleInputData:aData];
        }];
    }
}


@end
