/*
 *  MQMessage+Privates.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 23..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#ifndef MQKit_MQMessage_Privates_h
#define MQKit_MQMessage_Privates_h

#import "MQPacket.h"


@interface MQMessage (Privates)


- (void)setFixedHeader:(MQFixedHeader *)aFixedHeader;
- (void)setVariableHeader:(MQVariableHeader *)aVariableHeader;


@end


#endif
