/*
 *  MQMessageIDHeader.m
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQMessageIDHeader.h"
#import "MQVariableHeader+Privates.h"


@implementation MQMessageIDHeader


@synthesize messageID = mMessageID;


#pragma mark - override


- (NSData *)dataRepresentation
{
    [[self dataArray] removeAllValues];
    
    [[self dataArray] addUInt16:mMessageID];
    
    return [super dataRepresentation];
}


@end
