//
//  ItemCellView.h
//  Umundo
//  @description - The Cell UIView for each item in the ItemTableViewController
//
//  Created by Y Kamesh Rao on 04/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Items.h"
#import "HttpCommunicator.h"


@interface ItemCellView : UIView 
{
	ItemInfo			*item;
	HttpCommunicator	*thumbRequestor;
	NSMutableData		*imageDataFromServer;
	NSURLConnection		*httpConnection;	
	BOOL				isItem;
	NSString			*NavigationText;
	BOOL				isMyUmundoItem;
}

- (void)setItem: (ItemInfo *)newItem;

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
