//
//  HttpCommunicator.h
//  Umundo
//  @description - Imeplementation of the methods to create HTTP Requests
//
//  Created by deepak agarwal on 14/08/08.
//  Copyright 2008 Umundo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


#ifndef _HTTPCOMMUNICATOR_H_
#define _HTTPCOMMUNICATOR_H_

@interface HttpCommunicator : NSObject
{
	NSURLConnection	*httpConnection;  
	//NSMutableData	*receivedData;
	BOOL async;
	BOOL _ShouldKeepRunning;
}

- (NSMutableData *)receivedData;
- (void)makeAsyncRequest: (NSURL*)url: (NSDictionary *)headers: (NSString*)body: (id)delegate: (NSString *)requestMethod;
- (void)connection:	(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;  
- (void)connection:	(NSURLConnection *)connection didReceiveData:(NSData *)data;  
- (void)connection:	(NSURLConnection *)connection didFailWithError:(NSError *)error;  
- (void)connectionDidFinishLoading:	(NSURLConnection *)connection; 

- (void)createAndSendRequestTo: (NSString *)requestURL 
				   requestBody: (NSString *)requestBody 
					wsseHeader: (NSString *)wsseHeader 
		 serviceAuthentication: (NSString *)serviceAuthentication  
					  uniqueID: (NSString *)uniqueID 
					 timestamp: (NSString *)timestamp
					  delegate: (id)delegate;


- (void)createAndSendRequestToWithoutWSSE: (NSString *)requestURL 
				   requestBody: (NSString *)requestBody 
		 serviceAuthentication: (NSString *)serviceAuthentication  
					  uniqueID: (NSString *)uniqueID 
					 timestamp: (NSString *)timestamp
					  delegate: (id)delegate;


- (NSURLConnection *)sendAsyncRequestTo: (NSString *)requestURL andDelegateTo: (id)delegate;


- (void)createAndSendRequestToGetPost: (NSString *)requestURL 
						   wsseHeader: (NSString *)wsseHeader 
				serviceAuthentication: (NSString *)serviceAuthentication  
							 uniqueID: (NSString *)uniqueID 
							timestamp: (NSString *)timestamp
							 delegate: (id)delegate;

- (void)cancelHttpCommunications;

@end

#endif