/*
 *  MQConnectMessage.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQMessage.h"


@interface MQConnectMessage : MQMessage


+ (instancetype)messageWithClientIdentifier:(NSString *)aClientIdentifier;


- (void)setClientIdentifier:(NSString *)aClientIdentifier;
- (NSString *)clientIdentifier;


@end
