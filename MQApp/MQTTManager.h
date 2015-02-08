/*
 *  MQTTManager.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 10..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQKit.h"
#import "NEStreamHandler.h"


@interface MQTTManager : NSObject <NEStreamHandlerDelegate>


@property (nonatomic, assign) id delegate;


- (void)connectToHost:(NSHost *)aHost port:(NSInteger)aPort;
- (void)disconnect;
- (BOOL)isConnected;

- (void)ping;
- (void)subscribeTopic:(NSString *)aTopicName QoSLevel:(MQQoS)aQoSLevel;
- (void)publishToTopic:(NSString *)aTopicName contents:(NSData *)aContents QoSLevel:(MQQoS)aQoSLevel;


@end


@protocol MQTTManagerDelegate <NSObject>


- (void)mqttManager:(MQTTManager *)aManager didConnect:(BOOL)aSuccess error:(NSError *)aError;
- (void)mqttManager:(MQTTManager *)aManager didReceiveContents:(NSData *)aContents topicName:(NSString *)aTopicName;


@end
