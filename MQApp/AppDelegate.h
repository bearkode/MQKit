/*
 *  AppDelegate.h
 *  MQApp
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>


@interface AppDelegate : NSObject <NSApplicationDelegate>


@property (nonatomic, assign) IBOutlet NSWindow    *window;

@property (nonatomic, assign) IBOutlet NSTextField *addressTextField;
@property (nonatomic, assign) IBOutlet NSButton    *connectButton;
@property (nonatomic, assign) IBOutlet NSButton    *pingButton;

@property (nonatomic, assign) IBOutlet NSTextField *addSubscriptionTextField;
@property (nonatomic, assign) IBOutlet NSButton    *addSubscriptionButton;

@property (nonatomic, assign) IBOutlet NSTextView  *messageView;
@property (nonatomic, assign) IBOutlet NSTextView  *inputView;
@property (nonatomic, assign) IBOutlet NSButton    *sendButton;


- (IBAction)connectButtonClicked:(id)aSender;
- (IBAction)pingButtonClicked:(id)aSender;
- (IBAction)addSubscriptionButtonClicked:(id)aSender;
- (IBAction)sendButtonClicked:(id)aSender;


@end

