//
//  Channels.h
//  Umundo
//  description  - Class To handle the request and response of the channels
//  Created by Y Kamesh Rao on 23/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpResponseParser.h"
#import "AppProtocols.h"

struct _ChannelInfo
{
	NSString		*alias;					// Unique identifier of the channel
	NSString		*title;					// Channel title
	NSString		*description;			// Channel description
	NSString		*thumbnailUrl;			// URL to the channel's thumbnail
	NSString		*owner;					// Owner's login.
	NSString		*viewPermissions;		// Permissions to view channel. The possible values are:
											// - "members" - only members can view the channel
											// - "all" - everybody can view the channel
	NSString		*postPermissions;		// Permissions to post clips or pictures to the channel. The possible values are:
											// - "owner" - only owner can post
											// - "members" - only members (including owner) can post
											// - "all" - everybody can post
											// - "none" - nobody can post directly to the channel. Channel is updated automatically from external feed url.
	NSNumber		*itemsCount;			// Number of items in the channel
	NSNumber		*viewCount;				// Channel view count (Currenty average by items)
	NSNumber		*rating;				// Channel rating (Currenty average by items)
	NSDate			*lastUpdate;			// Last update time
	
	NSMutableArray	*tags;					// Array of tags. Each element of the array is a string representing single tag.	
	//NSNumber		*rating100;				// Channel rating from 0 to 100 (Currenty average by items)
	//NSNumber		*votes;					// Number of votes
//	CategoryInfo	*categories;			// array of categoryInfo struct

	//NSNumber		*lastUpdateInterval;	// Number of seconds elapsed after last update
	BOOL			indexed;				// defines whether channel and items it contains will be searchable
	BOOL			premium;				// True for premium channel	

	// Added by Kamesh to store the image
	NSString		*loadedThumbImage;		// Store the loaded thumbnail image
	UIImage			*thumbImage;			// Storing the thumbnail image
	BOOL			isThumbnailDone;		// tell whethere thumbnail is loaded or not
};


enum _ChannelsMode
{
	CI_BROWSING,
	CI_BROWSING_COUNT,
	CI_NONE
};



typedef struct _ChannelInfo ChannelInfo;
typedef enum _ChannelsMode ChannelsMode;


@interface Channels : HttpResponseParser
{
	ChannelInfo	**browsingChannels;
	
	int totalBrowsingChannels;
	int currBrowsingChannelsCount;
	
	BOOL iscategoriesChannelViewTableCreated;
	
	int currentThumbnailHit;
	
	ChannelsMode channelsMode;
	ChannelsMode prevChannelMode;
	
	NSString *currBrowsingCategoryID;
	NSString *currBrowsingFilter;
	
	id<ChannelsReceived> channelViewControllerDelegate;
	NSMutableData		*imageDataFromServer;
}

- (int)totalBrowsingChannels;

- (ChannelInfo **) browsingChannels;

- (void)deleteBrowsingChannels;

- (void)setChannelsMode: (ChannelsMode)mode;
- (void)setCurrBrowsingCategoryID: (NSString *)categoryID;
- (void)setCurrBrowsingFilter: (NSString *)filter;
- (void)setChannelViewControllerDelegate: (id)delegate;


- (int)currBrowsingChannelsCount;

- (NSString *)currBrowsingCategoryID;
- (NSString *)currBrowsingFilter;

- (ChannelsMode)channelsMode;
- (void)deleteNode: (ChannelInfo *)node;
- (void)parseReceivedDataToGetCount : (NSData *)response;

@end
