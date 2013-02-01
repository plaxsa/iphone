//
//  SmallItemCellView.h
//  MyNews
//
//  Created by ANKUR AGARWAL on 21/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Items.h"
#import "HttpCommunicator.h"

@interface SmallItemCellView : UIView 
{
	SlideShowInfo		*item;
	HttpCommunicator	*thumbRequestor;
	NSMutableData		*imageDataFromServer;
	NSURLConnection		*httpConnection;	
	BOOL				isItem;
	NSString			*NavigationText;
}

- (void)setItem: (SlideShowInfo *)newItem;

- (void)connection:	(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;  
- (void)connection:	(NSURLConnection *)connection didReceiveData:(NSData *)data;  
- (void)connection:	(NSURLConnection *)connection didFailWithError:(NSError *)error;  
- (void)connectionDidFinishLoading:	(NSURLConnection *)connection; 
- (void)cancelHttpCommunications;
- (BOOL)isItem;
- (void)setIsItem: (BOOL) value;
- (void)setText:(NSString*) string;
- (void)deleteItem;
- (BOOL)isChannelThumbnailDone;
- (void)callNeedToDisplay;


@end
