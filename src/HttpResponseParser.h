//
//  HttpResponseParser.h
//  Umundo
//  description  - Class To handle the HTTP request and response
//  Created by Y Kamesh Rao on 21/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSON/JSON.h>

@interface HttpResponseParser : NSObject 
{
	BOOL _ShouldKeepRunning;
	NSMutableData *responseMutableData;
}

- (void)setShouldKeepRunning: (BOOL)value;
- (void)parseReceivedData: (NSData *)response;
- (void)connection:	(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;  
- (void)connection:	(NSURLConnection *)connection didReceiveData:(NSData *)data;  
- (void)connection:	(NSURLConnection *)connection didFailWithError:(NSError *)error;  
- (void)connectionDidFinishLoading:	(NSURLConnection *)connection; 


@end
