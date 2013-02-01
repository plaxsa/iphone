//
//  HttpRequest.h
//
//  Umundo
//
//  description - Class to make request body for hppt request
//
//  Created by deepak agarwal on 12/08/08.
//
//  Copyright 2008 Umundo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <JSON/JSON.h>
#import "Encryptor.h"
#import "HttpCommunicator.h"
#import "Channels.h"
#import "FileHandler.h"

#ifndef _HTTPREQUEST_H_
#define _HTTPREQUEST_H_

@interface HttpRequest : NSObject 
{
	NSString *requestData;	
	NSString *responseData;
	SBJSON   *json;
	
	Encryptor			*aEncryptor;
	HttpCommunicator	*aHttpCommunicator;
	FileHandler			*aFileHandler;
}

- (NSString *)createJSONRequest:(NSDictionary*)dict;

- (id)init;
- (Encryptor *)aEncryptor;
- (void) setWSSE: (NSString *)wsse;
- (void)cancelTransaction;

@property(nonatomic,retain)SBJSON *json;


////////////////////////////////////////////////////////////////////////////////////
// Public API Wrapper						////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

- (void)getNumberOfPublicChannels:(NSString*)categoryId:(NSString*)sFilter;

- (void)getNumberOfUserSubscriptions:(NSString*)user;

- (void)getChannels:(NSString*)sFilter:(int)offset:(int)count:(id)callingclass;

- (void)getNumberOfItems:(NSString*)channelAlias;

- (void)getItems:(int)offset:(int) count:(NSString*)ordering:(NSString*)channelAlias:(NSString*)profileName:(id)callingClass;

- (void)getItem:(NSString*)itemGuid:(NSString*)profileName;

- (void)getUpdatedItemsByInterval: (NSArray *)channelAliases: (int)modifiedSinceInterval: (NSString *)profileName: (NSString *)ordering: (int)offset: (int)count:(id)callingClass;

- (void)getNumberOfUpdatedItemsByInterval: (NSArray *)channelAliases: (int)modifiedSinceInterval:(id)CallingClass;

- (void)getNumberOfChannels:(NSString*)filter :(id)callingclass;

- (void)getPublicChannels:(NSString*)categoryId:(NSString*)filter:(NSString*)order:(int)offset:(int)count;

- (void)getNumberOfChannelsByCategory:(NSString*)categoryId;

- (void)getChannelsByCategory:(NSString*)categoryId:(int)offset:(int)count;

- (void)getChannel:(NSString*)channelAlias;

- (void)getNumberOfUpdatedSubscriptionsByInterval:(int)modifiedSinceInterval;

- (void)getUpdatedSubscriptionsByInterval:(int)modifiedSinceInterval:(int)offset:(int)count;

- (void)getNumberOfSubscriptions;

- (void)getSubscriptions:(int)offset:(int)count:(id)callingclass;

- (void)hitForImage:(NSString *)requestURL andDelegateTo: (id)delegate;

- (void)getSlideshows:(NSString*)channelAlias:(int)maxShows:(NSString*)sortBy;

@end

#endif
