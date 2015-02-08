/*
 *  MQUtils.h
 *  MQKit
 *
 *  Created by bearkode on 2014. 9. 22..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>


NSString *MQBinaryStringFromByte(UInt8 aByte);

UInt8 MQGetByteInData(NSData *aData, NSUInteger aIndex);
NSData *MQEncodedDataFromString(NSString *aString);
NSString *MQStringFromEncodedData(NSData *aData, UInt16 *aHandledLength);
