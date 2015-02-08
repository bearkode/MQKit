/*
 *  MQMessageIDHeader.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 10. 7..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "MQVariableHeader.h"


@interface MQMessageIDHeader : MQVariableHeader
{
    UInt16 mMessageID;
}


@property (nonatomic, assign) UInt16 messageID;


@end
