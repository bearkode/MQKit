/*
 *  AppDelegate.m
 *  MQApp
 *
 *  Created by bearkode on 2014. 9. 24..
 *  Copyright (c) 2014 bearkode. All rights reserved.
 *
 */

#import "AppDelegate.h"
#import "MQKit.h"
#import "MQTTManager.h"


@implementation AppDelegate
{
    NSWindow    *mWindow;

    NSTextField *mAddressTextField;
    NSButton    *mConnectButton;
    NSButton    *mPingButton;

    NSTextField *mAddSubscriptionTextField;
    NSButton    *mAddSubscriptionButton;
    
    NSTextView  *mMessageView;
    NSTextView  *mInputView;
    
    MQTTManager *mMQTTManager;
}


@synthesize window                   = mWindow;

@synthesize addressTextField         = mAddressTextField;
@synthesize connectButton            = mConnectButton;
@synthesize pingButton               = mPingButton;

@synthesize addSubscriptionTextField = mAddSubscriptionTextField;
@synthesize addSubscriptionButton    = mAddSubscriptionButton;

@synthesize messageView              = mMessageView;
@synthesize inputView                = mInputView;


#pragma mark -


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [mAddressTextField setStringValue:@"10.77.23.98"];
    [mAddSubscriptionTextField setStringValue:@"testtopic/test"];
    
    mMQTTManager = [[MQTTManager alloc] init];
    [mMQTTManager setDelegate:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{

}


#pragma mark -


- (IBAction)connectButtonClicked:(id)aSender
{
    [mConnectButton setEnabled:NO];
    
    if ([mMQTTManager isConnected])
    {
        [mMQTTManager disconnect];
    }
    else
    {
        [mMQTTManager connectToHost:[NSHost hostWithAddress:[mAddressTextField stringValue]] port:1883];
    }
}


- (IBAction)pingButtonClicked:(id)aSender
{
    [mMQTTManager ping];
}


- (IBAction)addSubscriptionButtonClicked:(id)aSender
{
    NSString *sTopic = [mAddSubscriptionTextField stringValue];
    
    [mMQTTManager subscribeTopic:sTopic QoSLevel:kMQQoSExactlyOnce];
}


- (IBAction)sendButtonClicked:(id)aSender
{
    NSString *sTopic    = [mAddSubscriptionTextField stringValue];
    NSData   *sContents = [[mInputView string] dataUsingEncoding:NSUTF8StringEncoding];
    
    [mMQTTManager publishToTopic:sTopic contents:sContents QoSLevel:kMQQoSExactlyOnce];

    [mInputView setString:@""];
}


#pragma mark -


- (void)mqttManager:(MQTTManager *)aManager didConnect:(BOOL)aSuccess error:(NSError *)aError
{
    [mConnectButton setTitle:(aSuccess) ? @"Disconnect" : @"Connect"];
    [mConnectButton setEnabled:YES];
}


- (void)mqttManager:(MQTTManager *)aManager didReceiveContents:(NSData *)aContents topicName:(NSString *)aTopicName
{
    NSString *sString = [[[NSString alloc] initWithData:aContents encoding:NSUTF8StringEncoding] autorelease];

    [mMessageView insertText:sString];
    [mMessageView insertText:@"\n"];
}


@end
