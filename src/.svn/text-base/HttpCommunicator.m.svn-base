//
//  HttpCommunicator.m
//  Umundo
//  @description - Imeplementation of the methods to create HTTP Requests
//
//  Created by deepak agarwal on 12/08/08.
//  Copyright 2008 Umundo Inc. All rights reserved.
//

#import "HttpCommunicator.h"
#import "General.h"


@implementation HttpCommunicator

- (id)init
{
	self = [super init];
	if(self)
	{
	}
	
	return self;
}



-(NSMutableData *)receivedData
{
	return nil;
}

	

// Create request and Make the asynchronous request to server for data
- (void)createAndSendRequestTo: (NSString *)requestURL 
					  requestBody: (NSString *)requestBody 
					   wsseHeader: (NSString *)wsseHeader 
			serviceAuthentication: (NSString *)serviceAuthentication  
						 uniqueID: (NSString *)uniqueID 
						timestamp: (NSString *)timestamp
						 delegate: (id)delegate
{	
	NSURL* url = [NSURL URLWithString:requestURL];
	NSString* contentLen = [[NSString alloc] initWithFormat:@"%i",[requestBody length]];
	NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:
											@"WSSE profile=\"UsernameToken\"",	@"authorization",
											@"application/javascript"		 ,	@"Content-Type",
											uniqueID						 ,	@"umundo-uid",
											serviceAuthentication			 ,	@"umundo-signature",
											timestamp						 ,  @"umundo-timestamp",
											contentLen						 ,	@"Content-Length",
											GROUP_ALIAS						 ,  @"groupAlias",
											nil];
	
  
	[contentLen release];
	

	// Make an Asynchronous request
	[self makeAsyncRequest:url:headers:requestBody:delegate:@"POST"];
}



// Create request and Make the asynchronous request to server for data
- (void)createAndSendRequestToWithoutWSSE: (NSString *)requestURL 
							  requestBody: (NSString *)requestBody 
					serviceAuthentication: (NSString *)serviceAuthentication  
								 uniqueID: (NSString *)uniqueID 
								timestamp: (NSString *)timestamp
								 delegate: (id)delegate
{
	NSURL* url = [NSURL URLWithString:requestURL];
	NSString* contentLen = [[NSString alloc] initWithFormat:@"%i",[requestBody length]];
	NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:
							 @"application/javascript"		 ,	@"Content-Type",
							 uniqueID						 ,	@"umundo-uid",
							 serviceAuthentication			 ,	@"umundo-signature",
							 timestamp						 ,  @"umundo-timestamp",
							 contentLen						 ,	@"Content-Length",
							 GROUP_ALIAS					 ,  @"groupAlias",
							 nil];
	
	
	[contentLen release];
	
	
	// Make an Asynchronous request
	[self makeAsyncRequest:url:headers:requestBody:delegate:@"POST"];	
}



// description - To make AsyncRequest with Get post type
- (void)createAndSendRequestToGetPost: (NSString *)requestURL 
					wsseHeader: (NSString *)wsseHeader 
		 serviceAuthentication: (NSString *)serviceAuthentication  
					  uniqueID: (NSString *)uniqueID 
					 timestamp: (NSString *)timestamp
					  delegate: (id)delegate
{
	NSURL* url = [NSURL URLWithString:requestURL];	
	NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:
								@"WSSE profile=\"UsernameToken\"",	@"authorization",
								wsseHeader						 ,	@"X-WSSE",
								@"application/javascript"		 ,	@"Content-Type",
								GROUP_ALIAS						 ,  @"groupAlias",
						nil];
	
	// Make an Asynchronous request
	[self makeAsyncRequest:url:headers:nil:delegate:@"GET"];
}




// Make the synchronous request to server for data
- (NSURLConnection *)sendAsyncRequestTo: (NSString *)requestURL andDelegateTo: (id)delegate
{
	NSURL* url = [NSURL URLWithString:requestURL];
	
	// Make an Asynchronous request
	[self makeAsyncRequest:url:nil:nil:delegate:@"GET"];
	
	// Return the connection
	return httpConnection;
}



// Make the asynchronous request to server for data
- (void)makeAsyncRequest: (NSURL*)url: (NSDictionary *)headers: (NSString*)body: (id)delegate: (NSString *)requestMethod
{	
	//[receivedData setLength:0];
	
	NSMutableURLRequest* request;  
	
	request = [NSMutableURLRequest requestWithURL:url  
									  cachePolicy:NSURLRequestUseProtocolCachePolicy  
								  timeoutInterval:TIMEOUT_INTERVAL];  
	
	[request setHTTPMethod:requestMethod];
	
	if(headers)
	{
		[request setAllHTTPHeaderFields:headers]; 
	}

	if(body)
		[request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
	
	httpConnection = [[NSURLConnection alloc]	initWithRequest:request  
													   delegate:delegate  
											   startImmediately:YES];  

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
}




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  
{  
	//[receivedData setLength:0];  
}  



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  
{  
   // [receivedData setData:data];  
}  



- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error  
{  
	_ShouldKeepRunning =NO;
	[connection release];  
	httpConnection = nil;
}  



// recive the response from the server
- (void)connectionDidFinishLoading:(NSURLConnection *)connection  
{  
	_ShouldKeepRunning =NO;
    [connection release]; 
	httpConnection = nil;
}  



// @description- cancel all on going hits 
- (void)cancelHttpCommunications
{
	if(httpConnection)
	{
		httpConnection = nil;
		[httpConnection cancel];
	}
}


// Free all the allocated memory
- (void)dealloc
{
	[super dealloc];
}


@end
