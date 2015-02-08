/*
 *  MQVariableHeader.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "MQDataTypes.h"


@interface MQVariableHeader : NSObject <MQDataRepresentable>
{
    MQDataArray *mDataArray;
}


+ (instancetype)variableHeader;


@end
