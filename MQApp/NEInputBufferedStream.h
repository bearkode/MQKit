/*
 *  NEInputBufferedStream.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "NEBufferedStream.h"


@interface NEInputBufferedStream : NEBufferedStream


- (void)handleDataUsingBlock:(NSInteger (^)(NSData *aData))aBlock;


@end
