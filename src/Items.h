//
//  Items.h
//
//  Umundo
//
//  description  - Class To handle the request and response of the item
//
//  Created by deepak agarwal on 28/08/08.
//
//  Copyright 2008 UmundoInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpResponseParser.h"
#import "AppProtocols.h"



// @description - Item Info struct to store the item data of channel
struct _ItemInfo
{
	NSString		*guid;						//	Unique identifier of the item
	NSString		*title;						//  Item title
	NSString		*description;				//	Item description
	NSString		*thumbnailUrl;				//	URL of item thumbnail
	NSString		*enclosureUrl;				//	Clip/Image URL
	NSString		*itemType;					//	Permitted values: [photo, audio, video]
	NSNumber		*viewCount;					//	Number of times item was viewed
	NSNumber		*rating;						//	Item rating
	NSNumber		*votes;						//	Number of votes
	NSNumber		*enclosureLength;			//	Clip/Image size
	// Added by Kamesh
	NSString		*loadedThumbImage;		// Store the loaded thumbnail image	
	UIImage			*thumbImage;				//	Stores the loaded thumbnail image
	BOOL			isThumbnailDone;		// tell whethere thumbnail is loaded or not
};
typedef struct _ItemInfo ItemInfo;


struct _SmallItemInfo
{
	NSString *title;
	NSString *enclosureUrl;
	NSString *thumbnailUrl;
	NSString *description;
	NSNumber *totalSlidesCount; // added by deepak
};
typedef struct _SmallItemInfo SmallItemInfo;



struct _SlideShowInfo
{
	NSString *showName;
	NSString *thumbnailUrl;
	NSNumber *totalItems;	
	SmallItemInfo **slideItemInfo;
	
	NSString		*loadedThumbImage;		// Store the loaded thumbnail image	
	UIImage			*thumbImage;			//	Stores the loaded thumbnail image
	BOOL			isThumbnailDone;		// tell whethere thumbnail is loaded or not
};
typedef struct _SlideShowInfo SlideShowInfo;



// Enum to set the mode of the item class before request
enum _ItemMode
{
	II_ITEM,		// Request for item info
	II_ITEM_COUNT,	// Request to get total item count
	
	II_UPDATES,
	II_UPDATES_COUNT,
	
	II_HEADLINES_ITEM_COUNT,
	II_HEADLINES_ITEM,
	
	II_GALLERY_ITEM_COUNT,
	II_GALLERY_ITEM,
	
	SI_SLIDE_SHOW,
	
	// To maintain the all the item info of different channels to show in NEWS tab
	II_CHANNEL_ONE,
	II_CHANNEL_TWO,
	II_CHANNEL_THREE,
	II_CHANNEL_FOUR,
	II_CHANNEL_FIVE,
	II_CHANNEL_SIX,
	II_CHANNEL_SEVEN,
	II_CHANNEL_EIGHT,
	II_CHANNEL_NINE,
	II_CHANNEL_TEN,
	
	II_NONE
};

typedef enum   _ItemMode ItemMode;


@interface Items : HttpResponseParser 
{
	ItemInfo		**itemInfo;
	ItemInfo		**headlinesItemInfo;
	ItemInfo		**galleryItem;
	SlideShowInfo	**slideShowItemInfo;
	
	ItemInfo		**topChannelItemInfo;
	ItemInfo		**businessChannelItemInfo;
	ItemInfo		**entertainmentChannelItemInfo;
	ItemInfo		**sportsChannelItemInfo;
	ItemInfo		**cricketChannelItemInfo;
	ItemInfo		**footballChannelItemInfo;
	ItemInfo		**lifestyleChannelItemInfo;
	ItemInfo		**peopleChannelItemInfo;
	ItemInfo		**scienceChannelItemInfo;
	ItemInfo		**offbeatChannelItemInfo;
	
	
	ItemInfo	*searchItem;
	
	ItemMode	itemMode;
	ItemMode	prevItemMode;
	
	int			totalSlideShowsCount;
	int			totalIteminSlide;
	
	
	int			totalItemCount;
	int			currItemCount;
	int			offsetItemCount;
	
	int			totalMyUmundoItemCount;
	int			currMyUmundoItemCount;
	int			offsetMyUmundoItemCount;
	
	int			totalHeadLinesItemCount;
	int			currHeadLinesItemCount;
	int			offsetHeadLinesItemCount;
	
	int			totalGalleryItemCount;
	int			currGalleryItemCount;
	int			offsetGalleryItemCount;
	
	NSString    *channelAlias;
	NSString	*channelTitle;
	BOOL		isSecondTime;
	BOOL		isHitPreviousItem;
	BOOL		isHitMoreItem;
	
	NSString	*myUmundoItemchannelAlias;
	NSString	*myUmundoItemchannelTitle;
	BOOL		isMyUmundoItemSecondTime;
	BOOL		isHitPreviousMyUmundoItem;
	BOOL		isHitMoreMyUmundoItem;
	
	NSString	*headLineItemchannelAlias;
	NSString	*headLineItemchannelTitle;
	BOOL		isheadLineItemSecondTime;
	BOOL		isHitPreviousheadLineItem;
	BOOL		isHitMoreheadLineItem;
	
	NSString    *galleryItemchannelAlias;
	NSString	*galleryItemchannelTitle;
	BOOL		isGallerySecondTime;
	BOOL		isHitGalleryPreviousItem;
	BOOL		isHitGalleryMoreItem;
	
	int					currentThumbnailHit;
	NSMutableData		*imageDataFromServer;
	
	BOOL		isNewsItemSecondTime;
	int			currTopNewsItemCount;
	NSString	*topNewsItemchannelAlias;
	NSString	*topNewsItemchannelTitle;
	
	int			currBusinessItemCount;
	NSString	*businessItemchannelAlias;
	NSString	*businessItemchannelTitle;
	
	int			currEntertainmentItemCount;
	NSString	*entertainmentItemchannelAlias;
	NSString	*entertainmentItemchannelTitle;
	
	int			currSportsItemCount;
	NSString	*sportsItemchannelAlias;
	NSString	*sportsItemchannelTitle;
	
	int			currCricketItemCount;
	NSString	*cricketItemchannelAlias;
	NSString	*cricketItemchannelTitle;
	
	int			currFootballItemCount;
	NSString	*footballItemchannelAlias;
	NSString	*footballItemchannelTitle;
	
	int			currLifeStyleItemCount;
	NSString	*lifeStyleItemchannelAlias;
	NSString	*lifeStyleItemchannelTitle;
	
	int			currPeopleItemCount;
	NSString	*peopleItemchannelAlias;
	NSString	*peopleItemchannelTitle;
	
	int			currScienceItemCount;
	NSString	*scienceItemchannelAlias;
	NSString	*scienceItemchannelTitle;
	
	int			currOffbeatItemCount;
	NSString	*offbeatItemchannelAlias;
	NSString	*offbeatItemchannelTitle;
}


- (void)setTotalSlideShowsCount:(int)count;
- (int)totalSlideShowsCount;
- (void)deleteSlideShowInfo;
- (SlideShowInfo **)getSlideShowInfo;
- (void)deleteNodeSlideshowInfo: (SlideShowInfo *)node;
- (void)deleteSlideItemInfo: (SmallItemInfo **)node;
- (void)deleteItemNode: (SmallItemInfo *)node;
- (int)totalIteminSlide;
- (void)setTotalIteminSlide:(int)value;
-(void)ParseSlideShowItemData: (NSData *)response;



- (void)setItemsMode: (ItemMode)mode;

- (void)setChannelAlias: (NSString *)alias;
- (void)setChannelTitle: (NSString *)title;
- (void)setTotalItemCount: (int)count;
- (void)setOffSetItemCount: (int) value;
- (NSString *)channelAlias;
- (NSString *)channelTitle;
- (int)totalItemCount;
- (int)currItemCount;
- (int)offsetItemCount;
- (void)deleteItemInfo;
- (void)deleteNode: (ItemInfo *)node;
- (void)parseReceivedDataToGetCount: (NSData *)response;
- (ItemInfo **)itemInfo;
- (BOOL)isSecondTime;
- (void)setIsSecondTime:(BOOL)value;
- (void)setIsHitPreviousItem: (BOOL)value;
- (void)setIsHitMoreItem: (BOOL)value;


- (void)setHeadlineItemChannelAlias: (NSString *)alias;
- (void)setHeadlineItemChannelTitle: (NSString *)title;
- (void)setTotalHeadlineItemCount: (int)count;
- (void)setOffSetHeadlineItemCount: (int) value;
- (NSString *)HeadlineItemChannelAlias;
- (NSString *)HeadlineItemChannelTitle;
- (int)totalHeadlineItemCount;
- (int)currHeadlineItemCount;
- (int)offsetHeadlineItemCount;
- (void)deleteHeadlineItemInfo;
- (ItemInfo **)HeadlineItemInfo;
- (BOOL)isHeadlineSecondTime;
- (void)setIsHeadlineSecondTime:(BOOL)value;
- (void)setIsHitPreviousHeadlineItem: (BOOL)value;
- (void)setIsHitMoreHeadlineItem: (BOOL)value;
- (void)ParseHeadlineItemData: (NSData *)response;
- (void)UpdateHeadLineItemTableView;


- (void)setGalleryItemChannelAlias: (NSString *)alias;
- (void)setGalleryItemChannelTitle: (NSString *)title;
- (void)setTotalGalleryItemCount: (int)count;
- (void)setOffSetGalleryItemCount: (int) value;
- (NSString *)GalleryItemChannelAlias;
- (NSString *)GalleryItemChannelTitle;
- (int)totalGalleryItemCount;
- (int)currGalleryItemCount;
- (int)offsetGalleryItemCount;
- (void)deleteGalleryItemInfo;
- (ItemInfo **)GalleryItemInfo;
- (BOOL)isGallerySecondTime;
- (void)setIsGallerySecondTime:(BOOL)value;
- (void)setIsHitPreviousGalleryItem: (BOOL)value;
- (void)setIsHitMoreGalleryItem: (BOOL)value;
- (void)ParseGalleryItemData: (NSData *)response;
- (void)UpdateGalleryItemTableView;
- (void)UpdateGalleryItemTableViewAfterSlideShowRecived;

- (void)ParseItemData: (NSData *)response;
- (void)NewsUpdateItemTableView;


- (ItemInfo**) gettopChannelItemInfo;
- (ItemInfo**) getbusinessChannelItemInfo;
- (ItemInfo**) getentertainmentChannelItemInfo;
- (ItemInfo**) getsportsChannelItemInfo;
- (ItemInfo**) getcricketChannelItemInfo;
- (ItemInfo**) getfootballChannelItemInfo;
- (ItemInfo**) getlifestyleChannelItemInfo;
- (ItemInfo**) getpeopleChannelItemInfo;
- (ItemInfo**) getscienceChannelItemInfo;
- (ItemInfo**) getoffbeatChannelItemInfo;

- (int)currTopNewsItemCount;
- (int)currBusinessItemCount;
- (int)currEntertainmentItemCount;
- (int)currSportsItemCount;
- (int)currCricketItemCount;
- (int)currFootballItemCount;
- (int)currLifeStyleItemCount;
- (int)currPeopleItemCount;
- (int)currScienceItemCount;
- (int)currOffbeatItemCount;

- (void)ParseTopChannelItemData: (NSData *)response;
- (void)deleteTopNewsItemInfo;
- (void)deleteBusinessItemInfo;
- (void)deleteEntertainmentItemInfo;
- (void)deleteSportsItemInfo;
- (void)deleteCricketItemInfo;
- (void)deleteFootballItemInfo;
- (void)deleteLifestyleItemInfo;
- (void)deletePeopleItemInfo;
- (void)deleteScienceItemInfo;
- (void)deleteOffbeatItemInfo;
- (void)NewsAllItemInforecived;
- (void)setisNewsItemSecondTime:(BOOL)value;
- (BOOL)isNewsItemSecondTime;
@end
