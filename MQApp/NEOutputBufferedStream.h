/*
 *  NEOutputBufferedStream.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "NEBufferedStream.h"


@interface NEOutputBufferedStream : NEBufferedStream


- (void)writeData:(NSData *)aData;


@end
