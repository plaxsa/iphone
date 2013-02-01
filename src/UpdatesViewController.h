//
//  UpdatesViewController.h
//  Umundo
//	@description - Handles the interactions on the Updates View
//
//  Created by Y Kamesh Rao on 28/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppProtocols.h"
#import "Items.h"

// @description - Updated Item info struct to store the Updated item data of channel
struct _UpdatedItemInfo
{
	NSString	 *channelAlias;					// Unique identifier of the channel
	ItemInfo	 *itemInfo;				// itemInfo
};


enum _UpdatesMode
{
	UD_SYNCHING_SUBSCRIPTIONS,
	UD_UPDATES_COUNT,
	UD_UPDATES_ITEMS,
	UD_THUMBNAIL_START,
	UD_THUMBNAIL_DONE,
	UD_NONE
};



typedef struct _UpdatedItemInfo UpdatedItemInfo;
typedef enum _UpdatesMode UpdatesMode;



@interface UpdatesViewController : UIViewController<UIWebViewDelegate>
{
	NSMutableData   *responseMutableData;
	NSDate		    *lastUpdate;
	UpdatesMode		updatesMode;
	UpdatesMode		prevUpdatesMode;
	
	int				totalUpdatesCount;
	int				currUpdatesCount;
	UpdatedItemInfo **updatedItemInfo;
	
	BOOL			isUpdateCheckDone;
	BOOL			isUpdatedSecondTime;
	NSMutableData	*imageDataFromServer;
	int				currentThumbnailHit;
	BOOL			isSubscribeNewChannels;
	UIWebView		*updatesWebViewFooter;
	BOOL			isClicked;
}

//- (void)loadAdsrequest;
- (void)getChannelAliasandRequestforItems;
- (void)setIsSubscribeNewChannels:(BOOL)value;

- (void)syncSubscriptionsAndFetchFromBackendIfNeccessary: (BOOL)loadFromNet ;

- (void)setUpdateCheckDone: (BOOL)value;
- (void)setUpdatesMode: (UpdatesMode) mode;

- (BOOL)isUpdateCheckDone;
- (UpdatesMode)updatesMode;
- (UpdatedItemInfo **)updatedItemInfo;
- (int)currUpdatesCount;
- (int)totalUpdatesCount;


- (void)connection:	(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;  
- (void)connection:	(NSURLConnection *)connection didReceiveData:(NSData *)data;  
- (void)connection:	(NSURLConnection *)connection didFailWithError:(NSError *)error;  
- (void)connectionDidFinishLoading:	(NSURLConnection *)connection; 


- (void)deleteItemInfo;
- (void)deleteNode: (ItemInfo *)node;

@end
