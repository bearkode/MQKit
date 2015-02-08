/*
 *  MQMessageParser.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQParseResult.h"


@interface MQMessageParser : NSObject


+ (MQParseResult *)parseData:(NSData *)aData;


@end
