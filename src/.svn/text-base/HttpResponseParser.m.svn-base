//
//  HttpResponseParser.m
//  Umundo
//  description  - Class To handle the HTTP request and response
//  Created by Y Kamesh Rao on 21/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "HttpResponseParser.h"
#import <JSON/JSON.h>
#import "General.h"
#import "ViewManager.h"


@implementation HttpResponseParser


- (id)init
{
	if([super init])
	{
		responseMutableData = [[NSMutableData alloc] init];
		return self;
	}
	return nil;
}

- (void)setShouldKeepRunning: (BOOL)value
{
	_ShouldKeepRunning = value;
}



- (void)parseReceivedData : (NSData *)response
{

}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  
{  
	// Initialise the response mutable data object for starting to collect the data
	RELEASEIF(responseMutableData);
	responseMutableData = [[NSMutableData alloc] init];
}  



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  
{  
	[responseMutableData appendData: data];
}  



- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error  
{  
	_ShouldKeepRunning = NO;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;	
	[connection release];
}  




- (void)connectionDidFinishLoading:(NSURLConnection *)connection  
{  
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	_ShouldKeepRunning = NO;
	
	RELEASEIF(responseMutableData);
	[connection release];
}  



- (void)dealloc
{
	RELEASEIF(responseMutableData);
	[super dealloc];
}



@end
