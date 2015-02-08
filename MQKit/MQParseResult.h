/*
 *  MQParseResult.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQMessage.h"


@interface MQParseResult : NSObject
{
    MQMessage *mMessage;
    NSInteger  mHandledLength;
}


@property (nonatomic, readonly) MQMessage *message;
@property (nonatomic, readonly) NSInteger  handledLength;


+ (instancetype)parseResultWithMessage:(MQMessage *)aMessage handledLength:(NSInteger)aLength;


- (instancetype)initWithMessage:(MQMessage *)aMessage handledLength:(NSInteger)aLength;


@end
