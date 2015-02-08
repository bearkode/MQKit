/*
 *  MQMessageIDGenerator.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 8..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>


@interface MQMessageIDGenerator : NSObject


+ (void)setBaseMessageID:(UInt16)aBaseID;

+ (UInt16)generateMessageID;
+ (UInt16)lastMessageID;


@end
