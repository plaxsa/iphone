//
//  HttpRequest.m
//
//  Umundo
//
//  description - Class to make request body for hppt request
//
//  Created by deepak agarwal on 12/08/08.
//
//  Copyright 2008 Umundo Inc. All rights reserved.
//

#import "HTTPRequest.h"
#import "Encryptor.h"
#import "HttpCommunicator.h"
#import "General.h"
#import "Application.h"
#import "ViewManager.h"
#import <JSON/JSON.h>

@implementation HttpRequest


@synthesize json;

// @description : Custom init method for additional initializations
- (id)init
{
	[super init];
	
	aEncryptor = [Encryptor new];
	aHttpCommunicator = [HttpCommunicator new];
	
	return self;
}



- (Encryptor *)aEncryptor
{
	return aEncryptor;
}



- (void)setWSSE: (NSString *)wsse
{
	[aEncryptor setWSSEHeader: wsse ];
}




//	@description : Create a JSON Request
- (NSString *)createJSONRequest : (NSDictionary *) dict
{
	json = [SBJSON new];
	json.humanReadable = YES;
	requestData = [json stringWithObject:dict error:NULL];
	
	[json release];
	return requestData;
}



//	@description :  Function to make Json request for getting channels acc to filter
- (void)getChannels:(NSString*)sFilter:(int)offset:(int)count:(id)callingclass
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getChannels" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getChannels", @"cmd",
						  sFilter, @"filter",
						  [NSString stringWithFormat: @"%d", offset],@"offset",
						  [NSString stringWithFormat: @"%d", count],@"count",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getChannels"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:callingclass /*[[Application application] aChannels]*/
	 ];
	
}



//	@description :  Function to get Json request for getting Number of User Subscriptions
- (void)getNumberOfUserSubscriptions:(NSString*)user
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getNumberOfUserSubscriptions" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getNumberOfUserSubscriptions", @"cmd",
						  user,@"user",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getNumberOfUserSubscriptions"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aChannels]
	 ];
	
}




//	@description : Function to get Json request for getting ChannelInfo struct for Subscribed channel
- (void)getSubscriptions:(int)offset:(int)count:(id)callingclass
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getSubscriptions" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getSubscriptions", @"cmd",
						  [NSString stringWithFormat: @"%d", offset],@"offset",
						  [NSString stringWithFormat: @"%d", count],@"count",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getSubscriptions"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate: callingclass
	 ];
	
}



// @description - To get the total number of subscription
- (void)getNumberOfSubscriptions
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getNumberOfSubscriptions" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getNumberOfSubscriptions", @"cmd",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getNumberOfSubscriptions"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aChannels]
	 ];
		
}



//	@description : Get the item info struct of the particular channel
- (void)getItems:(int)offset:(int)count:(NSString*)ordering:(NSString*)channelAlias:(NSString*)profileName:(id)callingClass
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"item.getItems" withSecretKey:SecretKey];

	
	NSMutableString *requestresponseFilter = [[[NSMutableString alloc] init] autorelease];
	[requestresponseFilter appendString:@"{\"cmd\":\"item.getItems\",\"responseFilter\":["];
	[requestresponseFilter appendString:@"\"guid\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"title\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"description\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"thumbnailUrl\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"enclosureUrl\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"rating\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"type\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"viewCount\""];
	[requestresponseFilter appendString:@","];
	[requestresponseFilter appendString:@"\"enclosureLength\""];
	[requestresponseFilter appendString:@"], "];
	
	[requestresponseFilter appendFormat:@"\"channelAlias\":\"%@\",", channelAlias];
	[requestresponseFilter appendFormat:@"\"profileName\":\"%@\",", profileName];
	[requestresponseFilter appendFormat:@"\"ordering\":\"%@\",", ordering];
	[requestresponseFilter appendFormat:@"\"offset\":%i,", offset];
	[requestresponseFilter appendFormat:@"\"count\":%i}", count];
	
	
//	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
//						  @"item.getItems", @"cmd",
//						  ordering,@"ordering",
//						  profileName,@"profileName",
//						  channelAlias,@"channelAlias",
//						  [NSString stringWithFormat: @"%d", offset],@"offset",
//						  [NSString stringWithFormat: @"%d", count],@"count",
//						  nil];
//	NSString *requestresponseFilter = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"item.getItems"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestresponseFilter 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:callingClass
	 ];
	
	
}



//	@description : Get the item of particular guid
- (void)getItem:(NSString*)itemGuid:(NSString*)profileName
{
	
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"item.getItem" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"item.getItem", @"cmd",
						  itemGuid,@"itemGuid",
						  profileName,@"profileName",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"item.getItem"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aItems]
	 ];	
}



//	@description : Function to get Json request for getting number of User channels
- (void)getNumberOfChannels:(NSString*)filter : (id) callingclass
{
	
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getNumberOfChannels" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getNumberOfChannels", @"cmd",
						  filter,@"filter",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getNumberOfChannels"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:callingclass
	 ];	
	
	
	
}




//	@description :  Function to make Json request for getting Number Of Public Channels
- (void)getNumberOfPublicChannels:(NSString*)categoryId:(NSString*)sFilter
{
	
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getNumberOfPublicChannels" withSecretKey:SecretKey];
	
	// Create the JSON request Body
	NSDictionary *dict;
	
	if(categoryId)
	{
		dict = [NSDictionary dictionaryWithObjectsAndKeys:
							@"channel.getNumberOfPublicChannels", @"cmd",
							GROUP_ALIAS,@"groupAlias",
							categoryId,@"categoryId",
							sFilter, @"filter",
							nil];
	}
	else
	{
		dict = [NSDictionary dictionaryWithObjectsAndKeys:
							@"channel.getNumberOfPublicChannels", @"cmd",
							GROUP_ALIAS,@"groupAlias",
							sFilter, @"filter",
							nil];
	}
		
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getNumberOfPublicChannels"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aChannels]
	 ];
	
}



//	@description :  To get the list of public channel info struct
- (void)getPublicChannels: (NSString*)categoryId:(NSString*)filter:(NSString*)order:(int)offset:(int)count
{
		
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getPublicChannels" withSecretKey:SecretKey];
	
	NSDictionary *dict;
	
	if(categoryId)
	{	
		dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getPublicChannels", @"cmd",
						  GROUP_ALIAS,@"groupAlias",
						  categoryId,@"categoryId",
						  filter,@"filter",
						  order,@"order",
						  [NSString stringWithFormat: @"%d", offset],@"offset",
						  [NSString stringWithFormat: @"%d", count],@"count",
						  nil];
	}
	else
	{
		dict = [NSDictionary dictionaryWithObjectsAndKeys:
						@"channel.getPublicChannels", @"cmd",
						GROUP_ALIAS,@"groupAlias",
						filter,@"filter",
						order,@"order",
						[NSString stringWithFormat: @"%d", offset],@"offset",
						[NSString stringWithFormat: @"%d", count],@"count",
						nil];		
	}
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getPublicChannels"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aChannels]
	 ];	
	
	
		
}



- (void)hitForImage:(NSString *)requestURL andDelegateTo: (id)delegate
{
	// Make a Request to the backend
	[aHttpCommunicator sendAsyncRequestTo:requestURL andDelegateTo: delegate];
}




//	@description :  To get the number of item in the channel
- (void)getNumberOfItems:(NSString*)channelAlias
{
		
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"item.getNumberOfItems" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"item.getNumberOfItems", @"cmd",
						  channelAlias,@"channelAlias",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"item.getNumberOfItems"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aItems]
	 ];	
	
}






//	@description :  To get the number of channel in the particular category
- (void)getNumberOfChannelsByCategory:(NSString*)categoryId
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getNumberOfChannelsByCategory" withSecretKey:SecretKey];
	
	
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getNumberOfChannelsByCategory", @"cmd",
						  @"umundo",@"groupAlias",
						  categoryId,@"categoryId",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getNumberOfChannelsByCategory"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aChannels]
	 ];		
}



//	@description :  Return list of channels in category.
- (void)getChannelsByCategory:(NSString*)categoryId:(int)offset:(int)count
{
		
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getChannelsByCategory" withSecretKey:SecretKey];
	
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getChannelsByCategory", @"cmd",
						  @"umundo",@"groupAlias",
						  categoryId,@"categoryId",
						  [NSString stringWithFormat: @"%d", offset],@"offset",
						  [NSString stringWithFormat: @"%d", count],@"count",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getChannelsByCategory"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aChannels]
	 ];	
	
}



//	 @description :  Return information about specified channel.
- (void)getChannel:(NSString*)channelAlias
{
		
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getChannel" withSecretKey:SecretKey];
	
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getChannel", @"cmd",
						  channelAlias,@"channelAlias",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getChannel"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aChannels]
	 ];	
}



// @description : Function to get Json request for getting Number of Updated Subscriptions
- (void)getNumberOfUpdatedSubscriptionsByInterval:(int)modifiedSinceInterval
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getNumberOfUpdatedSubscriptionsByInterval" withSecretKey:SecretKey];
	
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getNumberOfUpdatedSubscriptionsByInterval", @"cmd",
						  modifiedSinceInterval,@"modifiedSinceInterval",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getNumberOfUpdatedSubscriptionsByInterval"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[ViewManager viewManager] viewController:UPDATES]
	 ];	

}



//	@description	Function to get Json request for getting ChannelInfo struct for Updated Subscribed channel by Interval
- (void)getUpdatedSubscriptionsByInterval:(int)modifiedSinceInterval:(int)offset:(int)count
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"channel.getUpdatedSubscriptionsByInterval" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"channel.getUpdatedSubscriptionsByInterval", @"cmd",
						  modifiedSinceInterval,@"modifiedSinceInterval",
						  [NSString stringWithFormat: @"%d", offset],@"offset",
						  [NSString stringWithFormat: @"%d", count],@"count",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"channel.getUpdatedSubscriptionsByInterval"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[ViewManager viewManager] viewController:UPDATES]
	 ];	
	
}



//	@description - Function to get the new items
- (void)getUpdatedItemsByInterval: (NSArray *)channelAliases: (int)modifiedSinceInterval: (NSString *)profileName: (NSString *)ordering: (int)offset: (int)count:(id)callingClass
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"item.getUpdatedItemsByInterval" withSecretKey:SecretKey];
	
	NSMutableString *requestBody = [[[NSMutableString alloc] init] autorelease];
	
	[requestBody appendString:@"{\"cmd\":\"item.getUpdatedItemsByInterval\", \"channelsAliases\":["];
	int arrLen = [channelAliases count];
	for(int i=0; i<arrLen; i++)
	{
		[requestBody appendFormat:@"\"%@\"", [channelAliases objectAtIndex:i]];
		if(i==arrLen-1)
		{
			[requestBody appendString:@"], "];
			break;
		}
		else
			[requestBody appendString:@","];
	}
	
	// This is to set response filter in tshe response data to get selevted items only
	[requestBody appendString:@"\"responseFilter\":["];
	[requestBody appendString:@"\"item&ampguid\""];
	[requestBody appendString:@","];
	[requestBody appendString:@"\"item&amptitle\""];
	[requestBody appendString:@","];
	[requestBody appendString:@"\"item&ampdescription\""];
	[requestBody appendString:@","];
	[requestBody appendString:@"\"item&ampthumbnailUrl\""];
	[requestBody appendString:@","];
	[requestBody appendString:@"\"item&ampenclosureUrl\""];
	[requestBody appendString:@","];
	[requestBody appendString:@"\"item&amptype\""];
	[requestBody appendString:@","];
	[requestBody appendString:@"\"item&ampenclosureLength\""];
	[requestBody appendString:@"], "];
	
	[requestBody appendFormat:@"\"modifiedSinceInterval\":%i,", modifiedSinceInterval];
	[requestBody appendFormat:@"\"profileName\":\"%@\",", profileName];
	[requestBody appendFormat:@"\"ordering\":\"%@\",", ordering];
	[requestBody appendFormat:@"\"offset\":%i,", offset];
	[requestBody appendFormat:@"\"count\":%i}", count];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"item.getUpdatedItemsByInterval"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:callingClass
	 ];
}



//	@description - Function to get the actual number of updated items
- (void)getNumberOfUpdatedItemsByInterval: (NSArray *)channelAliases: (int)modifiedSinceInterval:(id)CallingClass
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"item.getNumberOfUpdatedItemsByInterval" withSecretKey:SecretKey];
	
	NSMutableString *requestBody = [[[NSMutableString alloc] init] autorelease];
	
	[requestBody appendString:@"{ \"cmd\":\"item.getNumberOfUpdatedItemsByInterval\", \"channelsAliases\":["];
	int arrLen = [channelAliases count];
	for(int i=0; i<arrLen; i++)
	{
		[requestBody appendFormat:@"\"%@\"", [channelAliases objectAtIndex:i]];
		if(i==arrLen-1)
		{
			[requestBody appendString:@"], "];
			break;
		}
		else
			[requestBody appendString:@","];
	}
	[requestBody appendFormat:@"\"modifiedSinceInterval\":%i}", modifiedSinceInterval];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"item.getNumberOfUpdatedItemsByInterval"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:CallingClass
	 ];	
}



// Make request for slid show images
- (void)getSlideshows:(NSString*)channelAlias:(int)maxShows:(NSString*)sortBy
{
	// Generate the Signature
	[aEncryptor getSignatureForMethod:@"discovery.getSlideshows" withSecretKey:SecretKey];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"discovery.getSlideshows", @"cmd",
						  GROUP_ALIAS,@"groupAlias",
						  channelAlias,@"channelAlias",
						  [NSString stringWithFormat: @"%d", maxShows],@"maxShows",
						  sortBy,@"sortBy",
						  MOBILE_PROFILE_NAME,@"profileName",
						  nil];
	
	NSString *requestBody = [self createJSONRequest:dict];
	
	// Create the request URL
	NSString *requestURL = [PublicAPI stringByAppendingString:@"discovery.getSlideshows"];
	
	// Make a Request to the backend
	[aHttpCommunicator createAndSendRequestTo:requestURL 
								  requestBody:requestBody 
								   wsseHeader:[aEncryptor wsseHeader]
					    serviceAuthentication:[aEncryptor signature]
									 uniqueID:UmundoUID
								    timestamp:[aEncryptor timestamp]
									 delegate:[[Application application] aItems]
	 ];	
	
}



// @description- calls the cancelHttpCommnications method to cancel all on going hits 
- (void)cancelTransaction
{
	[aHttpCommunicator cancelHttpCommunications];
}


- (void)dealloc 
{
	[requestData release];
	[responseData release];
	[json release];
	[aEncryptor release];
	[aHttpCommunicator release];
	[super dealloc];	
}

@end
