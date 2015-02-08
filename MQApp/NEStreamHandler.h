/*
 *  NEStreamHandler.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "NEBufferedStream.h"


@interface NEStreamHandler : NSObject <NEBufferedStreamDelegate>


@property (nonatomic, assign) id delegate;


- (instancetype)initWithHost:(NSHost *)aHost port:(NSInteger)aPort;


- (void)writeData:(NSData *)aData;


@end



@protocol NEStreamHandlerDelegate <NSObject>


@required
- (NSInteger)streamHandler:(NEStreamHandler *)aStreamHandler handleInputData:(NSData *)aData;


@optional
- (void)streamHandler:(NEStreamHandler *)aStreamHandler didReceiveData:(NSData *)aData;


@end
