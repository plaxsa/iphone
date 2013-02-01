//
//  Items.m
//  Umundo
//
//  description  - Class To handle the request and response of the item
//
//  Created by deepak agarwal on 28/08/08.
//  Copyright 2008 Umundo Inc. All rights reserved.
//


#import "Items.h"
#import "General.h"
#import "ViewManager.h"
#import "Application.h"
#import "GalleryViewController.h"

@implementation Items


// @description	- To set the mode of the item class before request
- (void)setItemsMode: (ItemMode)mode
{
	itemMode = mode;
}



// @description - Sets the total items count for the channel
- (void)setTotalItemCount: (int)count
{
	totalItemCount = count;
}



// @description - Returns the total items count
- (int)totalItemCount
{
	return totalItemCount;
}



// @description - Returns the current items count
- (int)currItemCount
{
	return currItemCount;
}



// @description- returns the offset
- (int)offsetItemCount
{
	return offsetItemCount;
}



// @description - sets the offset
- (void)setOffSetItemCount: (int)value
{
	offsetItemCount = value;
}



// @description - Sets the channel alias for which the current items have been called
- (void)setChannelAlias: (NSString *)alias
{
	channelAlias = alias;
}



// @description - Returns the channel alias
- (NSString *)channelAlias
{
	return channelAlias;
}



// @description - Sets the channel title for which the current items have been called
- (void)setChannelTitle: (NSString *)title
{
	channelTitle = title;
}



// @description - Returns the channel title
- (NSString *)channelTitle
{
	return channelTitle;
}



// @description - Returns the sored items
- (ItemInfo **)itemInfo
{
	return itemInfo;
}



// @description - Get the isSecondTime
- (BOOL)isSecondTime
{
	return isSecondTime;
}



 // @description -To set the issecond time value
- (void)setIsSecondTime: (BOOL)value
{
	isSecondTime = value;
}


// gallery

//@description - To set the gallery item channel alias
- (void)setGalleryItemChannelAlias: (NSString *)alias
{
	RELEASEIF(galleryItemchannelAlias);
	galleryItemchannelAlias = alias;
	[galleryItemchannelAlias retain];
}


//@Description - To set the Item title
- (void)setGalleryItemChannelTitle: (NSString *)title
{
	RELEASEIF(galleryItemchannelTitle);
	galleryItemchannelTitle = title;
	[galleryItemchannelTitle retain];
}


// Set the total gallery item count
- (void)setTotalGalleryItemCount: (int)count
{
	totalGalleryItemCount = count;
}


// To set the item count
- (void)setOffSetGalleryItemCount: (int) value
{
	offsetGalleryItemCount = value;
}


// To get the item alias
- (NSString *)GalleryItemChannelAlias
{
	return galleryItemchannelAlias;
}


// To get the item title
- (NSString *)GalleryItemChannelTitle
{
	return galleryItemchannelTitle;
}


// To get the total item count
- (int)totalGalleryItemCount
{
	return totalGalleryItemCount;
}


// To get the current item count
- (int)currGalleryItemCount
{
	return currGalleryItemCount;
}


// To get the offset count
- (int)offsetGalleryItemCount
{
	return offsetGalleryItemCount;
}


//To get the gallery iteminfo
- (ItemInfo **)GalleryItemInfo
{
	return galleryItem;
}


// get the value for next time table call
- (BOOL)isGallerySecondTime
{
	return isGallerySecondTime;
}


// set the value for next time table call
- (void)setIsGallerySecondTime:(BOOL)value
{
	isGallerySecondTime = value;
}


// set the value for paging
- (void)setIsHitPreviousGalleryItem: (BOOL)value
{
	isHitGalleryPreviousItem = value;
}

// set the value for paging
- (void)setIsHitMoreGalleryItem: (BOOL)value
{
	isHitGalleryMoreItem = value;
}


// Headlines

// Set the headline item alias
- (void)setHeadlineItemChannelAlias: (NSString *)alias
{
	RELEASEIF(headLineItemchannelAlias);
	headLineItemchannelAlias = alias;
	[headLineItemchannelAlias retain];
	
}


// set the headline item title
- (void)setHeadlineItemChannelTitle: (NSString *)title
{
	RELEASEIF(headLineItemchannelTitle);
	headLineItemchannelTitle = title;
	[headLineItemchannelTitle retain];
}


// set the total headline item count
- (void)setTotalHeadlineItemCount: (int)count
{
	totalHeadLinesItemCount = count;
}


// set the offset of headline item
- (void)setOffSetHeadlineItemCount: (int) value
{
	offsetHeadLinesItemCount = value;
}


// get the headline item's channel alias
- (NSString *)HeadlineItemChannelAlias
{
	return headLineItemchannelAlias;
}


// get the headline item channel's title
- (NSString *)HeadlineItemChannelTitle
{
	return headLineItemchannelTitle;
}


// get the total headline item count
- (int)totalHeadlineItemCount
{
	return totalHeadLinesItemCount;
}


// get the current headline item count
- (int)currHeadlineItemCount
{
	return currHeadLinesItemCount;
}


// get the offset value
- (int)offsetHeadlineItemCount
{
	return offsetHeadLinesItemCount;
}


// get the headline iteminfo
- (ItemInfo **)HeadlineItemInfo
{
	return headlinesItemInfo;
}


// return the value for is hadeline table created previously or not
- (BOOL)isHeadlineSecondTime
{
	return isheadLineItemSecondTime;
}


// Set the value for headline table called previously or not
- (void)setIsHeadlineSecondTime:(BOOL)value
{
	isheadLineItemSecondTime = value;
}


// If hit for previous page set as YES
- (void)setIsHitPreviousHeadlineItem: (BOOL)value
{
	isHitPreviousheadLineItem = value;
}


// if hit for next page set as YES
- (void)setIsHitMoreHeadlineItem: (BOOL)value
{
	isHitMoreheadLineItem = value;
}


// set the total available show count
- (void)setTotalSlideShowsCount:(int)count
{
	totalSlideShowsCount = count;
}


// get the total available show count
- (int)totalSlideShowsCount
{
	return totalSlideShowsCount;
}


// get the total item available in each show count
- (int)totalIteminSlide
{
	return totalIteminSlide;
}


// set the total item available in each show count
- (void)setTotalIteminSlide:(int)value
{
	totalIteminSlide = value;
}



// Get the slide show info
- (SlideShowInfo **)getSlideShowInfo
{
	return slideShowItemInfo;
}


// @description - to set YES if we are hiting for previous page
- (void)setIsHitPreviousItem: (BOOL)value
{
	isHitPreviousItem = value;
}



// @description - to set YES if we are hiting for next page
- (void)setIsHitMoreItem: (BOOL)value
{
	isHitMoreItem = value;
}



// Return Current topnews item count
- (int)currTopNewsItemCount
{
	return currTopNewsItemCount;
}


// Return Current business item count
- (int)currBusinessItemCount
{
	return currBusinessItemCount;
}


// Return Current entertainment item count
- (int)currEntertainmentItemCount
{
	return currEntertainmentItemCount;
}


// Return Current sports item count
- (int)currSportsItemCount
{
	return currSportsItemCount;
}


// Return Current cricket item count
- (int)currCricketItemCount
{
	return currCricketItemCount;
}


// Return Current football item count
- (int)currFootballItemCount
{
	return currFootballItemCount;
}



// Return Current lifestyle item count
- (int)currLifeStyleItemCount
{
	return currLifeStyleItemCount;
}


// Return Current people item count
- (int)currPeopleItemCount
{
	return currPeopleItemCount;
}


// Return Current science item count
- (int)currScienceItemCount
{
	return currScienceItemCount;
}


// Return Current offbeat item count
- (int)currOffbeatItemCount
{
	return currOffbeatItemCount;
}


// Set the value
- (void)setisNewsItemSecondTime:(BOOL)value
{
	isNewsItemSecondTime = value;
}

// return the isNewsItemSecondTime value
- (BOOL)isNewsItemSecondTime
{
	return isNewsItemSecondTime;
}


// return the topChannelItemInfo struct
- (ItemInfo**) gettopChannelItemInfo
{
	return topChannelItemInfo;
}


// return the businessChannelItemInfo struct
- (ItemInfo**) getbusinessChannelItemInfo
{
	return businessChannelItemInfo;
}


// return the entertainmentChannelItemInfo struct
- (ItemInfo**) getentertainmentChannelItemInfo
{
	return entertainmentChannelItemInfo;
}


// return the sportsChannelItemInfo struct
- (ItemInfo**) getsportsChannelItemInfo
{
	return sportsChannelItemInfo;
}


// return the cricketChannelItemInfo struct
- (ItemInfo**) getcricketChannelItemInfo
{
	return cricketChannelItemInfo;
}


// return the footballChannelItemInfo struct
- (ItemInfo**) getfootballChannelItemInfo
{
	return footballChannelItemInfo;
}


// return the lifestyleChannelItemInfo struct
- (ItemInfo**) getlifestyleChannelItemInfo
{
	return lifestyleChannelItemInfo;
}


// return the peopleChannelItemInfo struct
- (ItemInfo**) getpeopleChannelItemInfo
{
	return peopleChannelItemInfo;
}


// return the scienceChannelItemInfo struct
- (ItemInfo**) getscienceChannelItemInfo
{
	return scienceChannelItemInfo;
}


// return the offbeatChannelItemInfo struct
- (ItemInfo**) getoffbeatChannelItemInfo
{
	return offbeatChannelItemInfo;
}




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  
{  
	
	[super connection:connection didReceiveResponse:response];
}  



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  
{  
	
	
	[super connection:connection didReceiveData:data];
}



//	@description - There was an error connecting to the server
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error  
{  
	
	if([[ViewManager viewManager] isMessageDisplayed])
		[[ViewManager viewManager] removeMessage];
	switch(itemMode)
	{
		case II_GALLERY_ITEM:
		case II_HEADLINES_ITEM:
		case SI_SLIDE_SHOW:
		 [[ViewManager viewManager] showMessageWithRetry: errorMessageNetFail andSetTitle: errorTitleSysErr andDelegateTo: self];
		break;
			
		case II_CHANNEL_ONE:
		case II_CHANNEL_TWO:
		case II_CHANNEL_THREE:
		case II_CHANNEL_FOUR:
		case II_CHANNEL_FIVE:
		case II_CHANNEL_SIX:
		case II_CHANNEL_SEVEN:
		case II_CHANNEL_EIGHT:
		case II_CHANNEL_NINE:
		case II_CHANNEL_TEN:
			 [[ViewManager viewManager] showMessageWithRetry: errorMessageNetFail andSetTitle: errorTitleSysErr andDelegateTo: self];
		break;
			
		default:
		 [[ViewManager viewManager] showMessage: errorMessageNetFail andSetTitle: errorTitleSysErr andDelegateTo: self];
		break;
	}
	
		[super connection:connection didFailWithError: error];
	
}




//	@description - Get the response data from the server
- (void)connectionDidFinishLoading: (NSURLConnection  *)connection
{  	
	NSData *data = [NSData dataWithBytes: [responseMutableData mutableBytes] length: [responseMutableData length]];
	switch(itemMode)
	{
		case II_ITEM:
		case II_GALLERY_ITEM:
		case II_HEADLINES_ITEM:
			{
				[self parseReceivedData : data];
			}
			break;
			
		case SI_SLIDE_SHOW:
		{
			[self ParseSlideShowItemData:data];
		}
		break;
			
		case II_ITEM_COUNT:
		case II_GALLERY_ITEM_COUNT:
		{
				[self parseReceivedDataToGetCount : data];
		}
		break;
			
		case II_CHANNEL_ONE:
		case II_CHANNEL_TWO:
		case II_CHANNEL_THREE:
		case II_CHANNEL_FOUR:
		case II_CHANNEL_FIVE:
		case II_CHANNEL_SIX:
		case II_CHANNEL_SEVEN:
		case II_CHANNEL_EIGHT:
		case II_CHANNEL_NINE:
		case II_CHANNEL_TEN:
		{
			[self ParseTopChannelItemData:data];
		}
		break;
			
	}
	// Call the superclass instance of this method to do the rest of the things
	[super connectionDidFinishLoading: connection];
}  



// hides alert sheet or popup. use this method when you need to explicitly dismiss the alert.
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if ( buttonIndex == 1)
	{
		switch(itemMode)
		{
			case II_GALLERY_ITEM:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				GalleryViewController* galleries = (GalleryViewController *)[[ViewManager viewManager] viewController:GALLERY_VIEW];
				[galleries getGalleryNews];
			}
				break;
			case II_HEADLINES_ITEM:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				HeadLinesViewController* headlines = (HeadLinesViewController *)[[ViewManager viewManager] viewController:HEADLINES];
				[headlines getTopNews];
			}
				break;
			case SI_SLIDE_SHOW:
			{
				[self UpdateGalleryItemTableView];
			}
				break;
				
			case II_CHANNEL_ONE:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : TOPNEWS_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
				
			case II_CHANNEL_TWO:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : BUSINESS_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
				
			break;
				
			case II_CHANNEL_THREE:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : ENTERTAINMENT_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
				
			break;
				
			case II_CHANNEL_FOUR:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : SPORTS_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
				
			case II_CHANNEL_FIVE:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : CRICKET_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
				
			case II_CHANNEL_SIX:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : FOOTBALL_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
				
			case II_CHANNEL_SEVEN:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : LIFESTYLE_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
				
			case II_CHANNEL_EIGHT:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : PEOPLE_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
				
			case II_CHANNEL_NINE:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : SCIENCE_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
				
			case II_CHANNEL_TEN:
			{
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT: OFFBEAT_ALIAS : MOBILE_PROFILE_NAME: self];
				[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
			}
			break;
		}
	}
	
	else if ( buttonIndex == 0)
	{
		if([[ViewManager viewManager] isMessageDisplayed])
			[[ViewManager viewManager] removeMessage];
	}
}	




// @description - To parse and get the item info struct data
- (void)parseReceivedData : (NSData *)response
{
	switch (itemMode)
	{
		case II_GALLERY_ITEM:
		{
			[self ParseGalleryItemData: response];
		}
			break;
		case II_HEADLINES_ITEM:
		{
			[self ParseHeadlineItemData: response];
		}
			break;
			
		default:
		{
			[self ParseItemData: response];
		}
			break;
	}
	
}


// @description	- To parse and get the total number of clips in the channel
- (void)parseReceivedDataToGetCount : (NSData *)response
{
	NSString *responseData = [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
	SBJSON *json = [SBJSON new];
	
	id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
	id error = [responseJSON objectForKey:@"error"];
	
	if( [error isKindOfClass:[NSNull class]] )	
	{
		switch (itemMode)
		{
			case II_GALLERY_ITEM_COUNT:
			{
				totalGalleryItemCount = 0;
				NSNumber *tempHolder;
				ASSIGNNUMBER(responseJSON, @"result", tempHolder);
				int tempTotal = [tempHolder intValue];
				totalGalleryItemCount = tempTotal;
			}
				break;
			default:
			{
				totalItemCount = 0;
				NSNumber *tempHolder;
				ASSIGNNUMBER(responseJSON, @"result", tempHolder);
				int tempTotal = [tempHolder intValue];
				totalItemCount = tempTotal;
				if (totalItemCount > MAX_CHANNEL_CLIP_VISIBLE)
					totalItemCount = MAX_CHANNEL_CLIP_VISIBLE;
			}
				break;
		}
	}
	else
	{
		NSNumber *eCode = [error objectForKey:@"errorCode"];
		
		// 3 means service authentication failure
		if ( [eCode intValue] == 3 )
		{
			[[ViewManager viewManager] showMessage: errorMessageFatal andSetTitle: errorTitleSysErr andDelegateTo: self];
		}		
		else if([eCode intValue])
		{
			NSMutableString *errMessage = [[[NSMutableString alloc] init] autorelease];
			[errMessage appendString: [error objectForKey: @"errorMessage"]];
			
			[[ViewManager viewManager] showMessage: errMessage andSetTitle: errorTitleSysErr andDelegateTo: self];			
		}
		else if([eCode intValue])
		{
			NSMutableString *errMessage = [[[NSMutableString alloc] init] autorelease];
			[errMessage appendString: [error objectForKey: @"errorMessage"]];
			
			[[ViewManager viewManager] showMessage: errMessage andSetTitle: errorTitleSysErr andDelegateTo: self];			
		}
	}	
	
	[responseData release];
	[json release]; 
}



// @description -To parse data for SlideShowInfo
-(void)ParseSlideShowItemData: (NSData *)response
{
	if ( response != nil)
	{
		NSString *responseData = [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
		SBJSON *json = [SBJSON new];
		
		id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
		id error = [responseJSON objectForKey:@"error"];
		
		if( [error isKindOfClass:[NSNull class]] )
		{
			// Remove the message view
			if([[ViewManager viewManager] isMessageDisplayed])
				[[ViewManager viewManager] removeMessage];
			
			id result = [responseJSON objectForKey:@"result"];
			
			// Releasing the existing ItemInfo structure
			[self deleteSlideShowInfo];
			
			NSUInteger count = [result count];
			totalSlideShowsCount = count;
			slideShowItemInfo = (SlideShowInfo**) malloc (sizeof(SlideShowInfo*[count]));
			
			for(int i = 0; i < count; i++)
			{
				slideShowItemInfo[i] = (SlideShowInfo*)malloc(sizeof(SlideShowInfo));
				id objAtIndex = [result objectAtIndex:i];
				
				
				ASSIGNSTRING(objAtIndex, @"showName", slideShowItemInfo[i]->showName);	
				ASSIGNSTRING(objAtIndex, @"showThumb", slideShowItemInfo[i]->thumbnailUrl);
				
				if( [slideShowItemInfo[i]->thumbnailUrl isEqualToString:@""])
					slideShowItemInfo[i]->thumbnailUrl = NULL;
				ASSIGNNUMBER(objAtIndex, @"totalItems", slideShowItemInfo[i]->totalItems);	
				
				totalIteminSlide = [slideShowItemInfo[i]->totalItems intValue];
				slideShowItemInfo[i]->slideItemInfo = (SmallItemInfo**) malloc (sizeof(SmallItemInfo*[totalIteminSlide]));
				id itemindex = [objAtIndex objectForKey: @"item"];
	
				for(int j = 0; j < totalIteminSlide; j++)
				{
					id currentitemindex = [itemindex objectAtIndex: j];
					slideShowItemInfo[i]->slideItemInfo[j] = (SmallItemInfo*)malloc(sizeof(SmallItemInfo));
					
					ASSIGNSTRING(currentitemindex, @"title", slideShowItemInfo[i]->slideItemInfo[j]->title);
					
					ASSIGNSTRING(currentitemindex, @"enclosureUrl", slideShowItemInfo[i]->slideItemInfo[j]->enclosureUrl);
					ASSIGNSTRING(currentitemindex, @"thumbnailUrl", slideShowItemInfo[i]->slideItemInfo[j]->thumbnailUrl);	
					ASSIGNSTRING(currentitemindex, @"description", slideShowItemInfo[i]->slideItemInfo[j]->description);
					
					RETAIN(slideShowItemInfo[i]->slideItemInfo[j]->title);
					RETAIN(slideShowItemInfo[i]->slideItemInfo[j]->enclosureUrl);
					RETAIN(slideShowItemInfo[i]->slideItemInfo[j]->thumbnailUrl);
					RETAIN(slideShowItemInfo[i]->slideItemInfo[j]->description);
				}
				
				// Capitalize the thing s that matter
				[slideShowItemInfo[i]->showName capitalizedString];
				
				
				RETAIN(slideShowItemInfo[i]->showName);
				RETAIN(slideShowItemInfo[i]->thumbnailUrl);
				RETAIN(slideShowItemInfo[i]->totalItems);
				
				slideShowItemInfo[i]->thumbImage = nil;
				slideShowItemInfo[i]->loadedThumbImage = nil;
				slideShowItemInfo[i]->isThumbnailDone = NO;
			}
			
			// Remove the message being displayed during this communication
			if ( [[ViewManager viewManager] isMessageDisplayed] )
				[[ViewManager viewManager] removeMessage];
			
			// display data in table
			[self UpdateGalleryItemTableViewAfterSlideShowRecived];
		}
		else
		{
			NSNumber *eCode = [error objectForKey:@"errorCode"];
			// 3 means service authentication failure
			if([eCode intValue] == 3)
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
			
				[self UpdateGalleryItemTableViewAfterSlideShowRecived];
				
				//[[ViewManager viewManager] showMessage: errorMessageFatal andSetTitle: errorTitleSysErr andDelegateTo: self];
			}
			else if([eCode intValue])
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				[self UpdateGalleryItemTableViewAfterSlideShowRecived];
				
				//NSMutableString *errMessage = [[[NSMutableString alloc] init] autorelease];
//				[errMessage appendString: [error objectForKey: @"errorMessage"]];
//				
//				[[ViewManager viewManager] showMessage: errMessage andSetTitle: errorTitleSysErr andDelegateTo: self];			
			}
		}	
		
		[responseData release];
		[json release]; 
	}
	else
	{
		[[ViewManager viewManager] showMessage: @"No Items to parse" andSetTitle: errorTitleSysErr andDelegateTo: self];
	}
	
}



- (void)ParseHeadlineItemData: (NSData *)response
{
	isHitMoreheadLineItem = NO;
	isHitPreviousheadLineItem = NO;
	
	if ( response != nil)
	{
		NSString *responseData = [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
		SBJSON *json = [SBJSON new];
		
		id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
		id error = [responseJSON objectForKey:@"error"];
		
		if( [error isKindOfClass:[NSNull class]] )
		{
			// Remove the message view
			if([[ViewManager viewManager] isMessageDisplayed])
				[[ViewManager viewManager] removeMessage];
			
			id result = [responseJSON objectForKey:@"result"];
			
			// Releasing the existing ItemInfo structure
			[self deleteHeadlineItemInfo];
			
			NSUInteger count = [result count];
			currHeadLinesItemCount = count;
			headlinesItemInfo = (ItemInfo**) malloc (sizeof(ItemInfo*[count]));
			
			for(int i = 0; i < count; i++)
			{
				headlinesItemInfo[i] = (ItemInfo*)malloc(sizeof(ItemInfo));
				id objAtIndex = [result objectAtIndex:i];
				
				
				ASSIGNSTRING(objAtIndex, @"guid", headlinesItemInfo[i]->guid);		
				ASSIGNSTRING(objAtIndex, @"title", headlinesItemInfo[i]->title);	
				ASSIGNSTRING(objAtIndex, @"description", headlinesItemInfo[i]->description);	
				ASSIGNSTRING(objAtIndex, @"thumbnailUrl", headlinesItemInfo[i]->thumbnailUrl);
				if( [headlinesItemInfo[i]->thumbnailUrl isEqualToString:@""])
					headlinesItemInfo[i]->thumbnailUrl = NULL;
				ASSIGNSTRING(objAtIndex, @"enclosureUrl", headlinesItemInfo[i]->enclosureUrl);	
				ASSIGNSTRING(objAtIndex, @"type", headlinesItemInfo[i]->itemType);	
				ASSIGNNUMBER(objAtIndex, @"enclosureLength", headlinesItemInfo[i]->enclosureLength);	
				
				// Capitalize the thing s that matter
				[headlinesItemInfo[i]->title capitalizedString];
				
				
				RETAIN(headlinesItemInfo[i]->guid);
				RETAIN(headlinesItemInfo[i]->title);
				RETAIN(headlinesItemInfo[i]->description);
				RETAIN(headlinesItemInfo[i]->thumbnailUrl);
				RETAIN(headlinesItemInfo[i]->enclosureUrl);
				RETAIN(headlinesItemInfo[i]->itemType);
				RETAIN(headlinesItemInfo[i]->enclosureLength);
				
				headlinesItemInfo[i]->thumbImage = nil;
				headlinesItemInfo[i]->loadedThumbImage = nil;
				headlinesItemInfo[i]->isThumbnailDone = NO;
			}
			
			// Remove the message being displayed during this communication
			if ( [[ViewManager viewManager] isMessageDisplayed] )
				[[ViewManager viewManager] removeMessage];
			
			// display data in table
			[self UpdateHeadLineItemTableView];
		}
		else
		{
			NSNumber *eCode = [error objectForKey:@"errorCode"];
			// 3 means service authentication failure
			if([eCode intValue] == 3)
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				[[ViewManager viewManager] showMessage: errorMessageFatal andSetTitle: errorTitleSysErr andDelegateTo: self];
			}
			else if([eCode intValue])
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				NSMutableString *errMessage = [[[NSMutableString alloc] init] autorelease];
				[errMessage appendString: [error objectForKey: @"errorMessage"]];
				
				[[ViewManager viewManager] showMessage: errMessage andSetTitle: errorTitleSysErr andDelegateTo: self];			
			}
		}	
		
		[responseData release];
		[json release]; 
	}
	else
	{
		[[ViewManager viewManager] showMessage: @"No Items to parse" andSetTitle: errorTitleSysErr andDelegateTo: self];
	}
	
}


////Parse the recived server data for gallery tab
- (void)ParseGalleryItemData: (NSData *)response
{
	isHitGalleryMoreItem = NO;
	isHitGalleryPreviousItem = NO;
	
	if ( response != nil)
	{
		NSString *responseData = [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
		SBJSON *json = [SBJSON new];
		
		id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
		id error = [responseJSON objectForKey:@"error"];
		
		if( [error isKindOfClass:[NSNull class]] )
		{
			// Remove the message view
			if([[ViewManager viewManager] isMessageDisplayed])
				[[ViewManager viewManager] removeMessage];
			
			id result = [responseJSON objectForKey:@"result"];
			
			// Releasing the existing ItemInfo structure
			[self deleteGalleryItemInfo];
			
			NSUInteger count = [result count];
			currGalleryItemCount = count;
			galleryItem = (ItemInfo**) malloc (sizeof(ItemInfo*[count]));
			
			for(int i = 0; i < count; i++)
			{
				galleryItem[i] = (ItemInfo*)malloc(sizeof(ItemInfo));
				id objAtIndex = [result objectAtIndex:i];
				
				ASSIGNSTRING(objAtIndex, @"guid", galleryItem[i]->guid);		
				ASSIGNSTRING(objAtIndex, @"title", galleryItem[i]->title);	
				ASSIGNSTRING(objAtIndex, @"description", galleryItem[i]->description);	
				ASSIGNSTRING(objAtIndex, @"thumbnailUrl", galleryItem[i]->thumbnailUrl);
				if( [galleryItem[i]->thumbnailUrl isEqualToString:@""])
					galleryItem[i]->thumbnailUrl = NULL;
				ASSIGNSTRING(objAtIndex, @"enclosureUrl", galleryItem[i]->enclosureUrl);	
				ASSIGNSTRING(objAtIndex, @"type", galleryItem[i]->itemType);	
				ASSIGNNUMBER(objAtIndex, @"enclosureLength", galleryItem[i]->enclosureLength);	
				
				// Capitalize the thing s that matter
				[galleryItem[i]->title capitalizedString];
				
				
				RETAIN(galleryItem[i]->guid);
				RETAIN(galleryItem[i]->title);
				RETAIN(galleryItem[i]->description);
				RETAIN(galleryItem[i]->thumbnailUrl);
				RETAIN(galleryItem[i]->enclosureUrl);
				RETAIN(galleryItem[i]->itemType);
				RETAIN(galleryItem[i]->enclosureLength);
				
				galleryItem[i]->thumbImage = nil;
				galleryItem[i]->loadedThumbImage = nil;
				galleryItem[i]->isThumbnailDone = NO;
			}
			
			// Remove the message being displayed during this communication
			if ( [[ViewManager viewManager] isMessageDisplayed] )
				[[ViewManager viewManager] removeMessage];
			
			// display data in table
			[self UpdateGalleryItemTableView];
		}
		else
		{
			NSNumber *eCode = [error objectForKey:@"errorCode"];
			// 3 means service authentication failure
			if([eCode intValue] == 3)
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				[[ViewManager viewManager] showMessage: errorMessageFatal andSetTitle: errorTitleSysErr andDelegateTo: self];
			}
			else if([eCode intValue])
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				NSMutableString *errMessage = [[[NSMutableString alloc] init] autorelease];
				[errMessage appendString: [error objectForKey: @"errorMessage"]];
				
				[[ViewManager viewManager] showMessage: errMessage andSetTitle: errorTitleSysErr andDelegateTo: self];			
			}
		}	
		
		[responseData release];
		[json release]; 
	}
	else
	{
		[[ViewManager viewManager] showMessage: @"No Items to parse" andSetTitle: errorTitleSysErr andDelegateTo: self];
	}
	
}




// To parse the news tabs item info data
- (void)ParseTopChannelItemData: (NSData *)response
{
	NSString *responseData = [[[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding] autorelease];
	SBJSON *json = [[[SBJSON init] alloc] autorelease];
	
	id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
	id error = [responseJSON objectForKey:@"error"];
	
	if( [error isKindOfClass:[NSNull class]] )
	{
		ItemInfo **tempItems;
	
		id result = [responseJSON objectForKey:@"result"];
		int count = [result count];
		
		// Making mem alloc for temp pointer of channel info
		tempItems = (ItemInfo**)malloc(sizeof(ItemInfo)*count);
		for ( int i = 0; i < count; i++)
		{
			tempItems[i] = (ItemInfo*)malloc(sizeof(ItemInfo));
			id objAtIndex = [result objectAtIndex:i];
			
			ASSIGNSTRING(objAtIndex, @"guid", tempItems[i]->guid);		
			ASSIGNSTRING(objAtIndex, @"title", tempItems[i]->title);	
			ASSIGNSTRING(objAtIndex, @"description", tempItems[i]->description);	
			ASSIGNSTRING(objAtIndex, @"thumbnailUrl", tempItems[i]->thumbnailUrl);
			if( [tempItems[i]->thumbnailUrl isEqualToString:@""])
				tempItems[i]->thumbnailUrl = NULL;
			ASSIGNSTRING(objAtIndex, @"enclosureUrl", tempItems[i]->enclosureUrl);	
			ASSIGNSTRING(objAtIndex, @"type", tempItems[i]->itemType);	
			
			ASSIGNNUMBER(objAtIndex, @"enclosureLength", tempItems[i]->enclosureLength);	
			
			// Capitalize the thing s that matter
			[tempItems[i]->title capitalizedString];
			
			RETAIN(tempItems[i]->guid);
			RETAIN(tempItems[i]->title);
			RETAIN(tempItems[i]->description);
			RETAIN(tempItems[i]->thumbnailUrl);
			RETAIN(tempItems[i]->enclosureUrl);
			RETAIN(tempItems[i]->itemType);
			RETAIN(tempItems[i]->enclosureLength);
			tempItems[i]->thumbImage = nil;
			tempItems[i]->loadedThumbImage = nil;
			tempItems[i]->isThumbnailDone = NO;
		}
		
		switch(itemMode)
		{
			case II_CHANNEL_ONE:
			{
				[self deleteTopNewsItemInfo];
				
				// Copy the newly created TopNewsItemInfo array structure into topChannelItemInfo 
				topChannelItemInfo = tempItems;
				currTopNewsItemCount = count;
				
				[self setItemsMode: II_CHANNEL_TWO];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : BUSINESS_ALIAS : MOBILE_PROFILE_NAME: self];
			}
			break;
			
			case II_CHANNEL_TWO:
			{
				[self deleteBusinessItemInfo];
				
				// Copy the newly created ItemInfo array structure into BusinessItemInfo
				businessChannelItemInfo = tempItems;
				currBusinessItemCount = count;
				
				[self setItemsMode: II_CHANNEL_THREE];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT :ENTERTAINMENT_ALIAS : MOBILE_PROFILE_NAME: self];				
				
			}
			break;
			
			case II_CHANNEL_THREE:
			{
				[self deleteEntertainmentItemInfo];
				
				// Copy the newly created ItemInfo array structure into entertainmentChannelItemInfo
				entertainmentChannelItemInfo = tempItems;
				currEntertainmentItemCount = count;
				
				[self setItemsMode: II_CHANNEL_FOUR];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : SPORTS_ALIAS : MOBILE_PROFILE_NAME: self];				
				
				
			}
			break;
			
			case II_CHANNEL_FOUR:
			{
				
				[self deleteSportsItemInfo];
				
				// Copy the newly created ItemInfo array structure into sportsChannelItemInfo
				sportsChannelItemInfo = tempItems;
				currSportsItemCount = count;
				
				[self setItemsMode: II_CHANNEL_FIVE];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : CRICKET_ALIAS : MOBILE_PROFILE_NAME: self];				
				
			}
			break;
			case II_CHANNEL_FIVE:
			{
				
				[self deleteCricketItemInfo];
				
				// Copy the newly created ItemInfo array structure into cricketChannelItemInfo
				cricketChannelItemInfo = tempItems;
				currCricketItemCount = count;
				
				[self setItemsMode: II_CHANNEL_SIX];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT :FOOTBALL_ALIAS : MOBILE_PROFILE_NAME: self];				

			}
			break;
			
			case II_CHANNEL_SIX:
			{
				
				[self deleteFootballItemInfo];
				
				// Copy the newly created ItemInfo array structure into footballChannelItemInfo
				footballChannelItemInfo = tempItems;
				currFootballItemCount = count;
				
				[self setItemsMode: II_CHANNEL_SEVEN];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT :LIFESTYLE_ALIAS : MOBILE_PROFILE_NAME: self];				
								
				
			}
			break;
			
			case II_CHANNEL_SEVEN:
			{
				
				[self deleteLifestyleItemInfo];
				
				// Copy the newly created ItemInfo array structure into lifestyleChannelItemInfo
				lifestyleChannelItemInfo = tempItems;
				currLifeStyleItemCount = count;
				
				[self setItemsMode: II_CHANNEL_EIGHT];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT :PEOPLE_ALIAS : MOBILE_PROFILE_NAME: self];				
				
				
			}
			break;
			
			case II_CHANNEL_EIGHT:
			{
			
				[self deletePeopleItemInfo];
				
				// Copy the newly created ItemInfo array structure into peopleChannelItemInfo
				peopleChannelItemInfo = tempItems;
				currPeopleItemCount = count;
				
				[self setItemsMode: II_CHANNEL_NINE];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT :SCIENCE_ALIAS : MOBILE_PROFILE_NAME: self];				
				
				
				
			}
			break;
			
			case II_CHANNEL_NINE:
			{
			
				[self deleteScienceItemInfo];
				
				// Copy the newly created ItemInfo array structure into scienceChannelItemInfo
				scienceChannelItemInfo = tempItems;
				currScienceItemCount = count;
				
				[self setItemsMode: II_CHANNEL_TEN];
				[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : OFFBEAT_ALIAS : MOBILE_PROFILE_NAME: self];				
				
				
			}
			break;
			
			case II_CHANNEL_TEN:
			{
				// Remove the message being displayed during this communication
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				[self deleteOffbeatItemInfo];
				
				// Copy the newly created ItemInfo array structure into offbeatChannelItemInfo
				offbeatChannelItemInfo = tempItems;
				currOffbeatItemCount = count;	
				
				[self NewsAllItemInforecived];
			}
			break;
		}
		
	}
	else
	{
		NSNumber *eCode = [error objectForKey:@"errorCode"];
		// 3 means service authentication failure
		if ( [eCode intValue] == 3 )
		{
			// Remove the message view
			if([[ViewManager viewManager] isMessageDisplayed])
				[[ViewManager viewManager] removeMessage];
			[[ViewManager viewManager] showMessage: errorMessageFatal andSetTitle: errorTitleSysErr andDelegateTo: self];
		}
		else if([eCode intValue])
		{
			// Remove the message view
			if([[ViewManager viewManager] isMessageDisplayed])
				[[ViewManager viewManager] removeMessage];
			NSMutableString *errMessage = [[[NSMutableString alloc] init] autorelease];
			[errMessage appendString: [error objectForKey: @"errorMessage"]];
			
			[[ViewManager viewManager] showMessage: errMessage andSetTitle: errorTitleSysErr andDelegateTo: self];			
		}
	}
	
}




// @description -To parse data for Items
-(void)ParseItemData: (NSData *)response
{
	isHitMoreItem = NO;
	isHitPreviousItem = NO;
	
	if ( response != nil)
	{
		NSString *responseData = [[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding];
		SBJSON *json = [SBJSON new];
		
		id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
		id error = [responseJSON objectForKey:@"error"];
		
		if( [error isKindOfClass:[NSNull class]] )
		{
			// Remove the message view
			if([[ViewManager viewManager] isMessageDisplayed])
				[[ViewManager viewManager] removeMessage];
			
			id result = [responseJSON objectForKey:@"result"];
			
			// Releasing the existing ItemInfo structure
			[self deleteItemInfo];
			
			NSUInteger count = [result count];
			currItemCount = count;
			itemInfo = (ItemInfo**) malloc (sizeof(ItemInfo*[count]));
			
			for(int i = 0; i < count; i++)
			{
				itemInfo[i] = (ItemInfo*)malloc(sizeof(ItemInfo));
				id objAtIndex = [result objectAtIndex:i];
				
				
				ASSIGNSTRING(objAtIndex, @"guid", itemInfo[i]->guid);		
				ASSIGNSTRING(objAtIndex, @"title", itemInfo[i]->title);	
				ASSIGNSTRING(objAtIndex, @"description", itemInfo[i]->description);	
				ASSIGNSTRING(objAtIndex, @"thumbnailUrl", itemInfo[i]->thumbnailUrl);
				if( [itemInfo[i]->thumbnailUrl isEqualToString:@""])
					itemInfo[i]->thumbnailUrl = NULL;
				ASSIGNSTRING(objAtIndex, @"enclosureUrl", itemInfo[i]->enclosureUrl);	
				ASSIGNSTRING(objAtIndex, @"type", itemInfo[i]->itemType);	
	
				ASSIGNNUMBER(objAtIndex, @"enclosureLength", itemInfo[i]->enclosureLength);	
				
				// Capitalize the thing s that matter
				[itemInfo[i]->title capitalizedString];
				
				
				RETAIN(itemInfo[i]->guid);
				RETAIN(itemInfo[i]->title);
				RETAIN(itemInfo[i]->description);
				RETAIN(itemInfo[i]->thumbnailUrl);
				RETAIN(itemInfo[i]->enclosureUrl);
				RETAIN(itemInfo[i]->itemType);
				RETAIN(itemInfo[i]->enclosureLength);
				
				itemInfo[i]->thumbImage = nil;
				itemInfo[i]->loadedThumbImage = nil;
				itemInfo[i]->isThumbnailDone = NO;
			}
			
			// Remove the message being displayed during this communication
			if ( [[ViewManager viewManager] isMessageDisplayed] )
				[[ViewManager viewManager] removeMessage];
			
			// display data in table
			[self NewsUpdateItemTableView];
		}
		else
		{
			NSNumber *eCode = [error objectForKey:@"errorCode"];
			// 3 means service authentication failure
			if([eCode intValue] == 3)
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				[[ViewManager viewManager] showMessage: errorMessageFatal andSetTitle: errorTitleSysErr andDelegateTo: self];
			}
			else if([eCode intValue])
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				NSMutableString *errMessage = [[[NSMutableString alloc] init] autorelease];
				[errMessage appendString: [error objectForKey: @"errorMessage"]];
				
				[[ViewManager viewManager] showMessage: errMessage andSetTitle: errorTitleSysErr andDelegateTo: self];			
			}
		}	
		
		[responseData release];
		[json release]; 
	}
	else
	{
		[[ViewManager viewManager] showMessage: @"No Items to parse" andSetTitle: errorTitleSysErr andDelegateTo: self];
	}
	
}



// Method call when all the news channel items completed and now the time to dispaly them on table
- (void)NewsAllItemInforecived
{
	
	ViewManager *viewMan = [ViewManager viewManager];
	
	// Check if clips comes to display first time or called through more clips option
	if (isNewsItemSecondTime == NO)
	{
		// Create the required views
		[viewMan releaseViewController: CATEGORIES_TABLE_VIEW];
		
		// Create the Category Table View Controller
		[viewMan createTableViewController: CATEGORIES_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: @"News" andRowHeight: CHANNEL_TBL_ROW_HEIGHT];	
		
		// Create the Category Navigation View Controller and add the Category Table View to the Navigation View
		[viewMan createNavigationViewController: CATEGORIES_NAVIGATION_VIEW andInitWithRootViewController: CATEGORIES_TABLE_VIEW];
		
		// Add the categories Navigation View Controller over the category View Controller
		[viewMan addViewOfController: CATEGORIES_NAVIGATION_VIEW overTheViewOfController: CATEGORIES];	
		isNewsItemSecondTime = YES;
		
	}		
	else
	{
		CategoriesTableViewController* itemTable = (CategoriesTableViewController *)[viewMan viewController:CATEGORIES_TABLE_VIEW];
		
		// Free the existing Table View
		CGRect tableFrame = itemTable.tableView.frame;
		
		// Create a brand new table and set its delegate to be the ChannelsTableViewController class
		UITableView *newTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
		[newTable setBackgroundColor:[UIColor clearColor]];
		newTable.delegate = itemTable;
		newTable.rowHeight = CHANNEL_TBL_ROW_HEIGHT;
		// Set the New table view as the table in existing TableViewController
		itemTable.tableView = newTable;
		[newTable release];
		
	}	
	
}


//@description - load the table when data get parsed
- (void)NewsUpdateItemTableView
{
	ViewManager *viewMan = [ViewManager viewManager];
	
	// Check if clips comes to display first time or called through more clips option
	if (isSecondTime == NO)
	{
		// Create the required views
		[viewMan releaseViewController: ITEM_TABLE_VIEW];
		[viewMan createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: [[[Application application] aItems] channelTitle] andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[viewMan pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		isSecondTime = YES;
	}		
	else
	{
		ItemTableViewController* itemTable = (ItemTableViewController *)[viewMan viewController:ITEM_TABLE_VIEW];
		
		// Free the existing Table View
		CGRect tableFrame = itemTable.tableView.frame;
		
		// Create a brand new table and set its delegate to be the ChannelsTableViewController class
		UITableView *newTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
		[newTable setBackgroundColor:[UIColor clearColor]];
		newTable.delegate = itemTable;
		newTable.rowHeight = CHANNEL_TBL_ROW_HEIGHT;
		// Set the New table view as the table in existing TableViewController
		itemTable.tableView = newTable;
		[newTable release];
		
	}
}



//@description - Request for slide show data after recived videos data
- (void)UpdateGalleryItemTableView
{
	[self setItemsMode: SI_SLIDE_SHOW];
	[[[Application application] aHttpRequest] getSlideshows:SLIDE_SHOW_CHANNELALIAS :NUMBER_OF_SLIDES :@"count"];
	
	// Set the Animation view that shows the status that the item fetch is in progress
	[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageClips];
}
	


// @description - Here we have videos and slides both now show them in the Gallery table
- (void)UpdateGalleryItemTableViewAfterSlideShowRecived
{
	ViewManager *viewMan = [ViewManager viewManager];

	GalleryItemTableViewController* itemTable = (GalleryItemTableViewController *)[viewMan viewController:GALLERY_ITEM_TABLE_VIEW];
	
	// Free the existing Table View
	CGRect tableFrame = itemTable.tableView.frame;

	// Create a brand new table and set its delegate to be the ChannelsTableViewController class
	UITableView *newTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
	[newTable setBackgroundColor:[UIColor clearColor]];
	newTable.delegate = itemTable;
	newTable.rowHeight = CHANNEL_TBL_ROW_HEIGHT;
	// Set the New table view as the table in existing TableViewController
	itemTable.tableView = newTable;
	[newTable release]; 
}


// set the item info data to headline item table view
- (void)UpdateHeadLineItemTableView
{
	ViewManager *viewMan = [ViewManager viewManager];
	
	HeadLinesItemTableViewController* itemTable = (HeadLinesItemTableViewController *)[viewMan viewController:HEADLINES_ITEM_TABLE_VIEW];
	
	// Free the existing Table View
	CGRect tableFrame = itemTable.tableView.frame;
	
	// Create a brand new table and set its delegate to be the ChannelsTableViewController class
	UITableView *newTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
	[newTable setBackgroundColor:[UIColor clearColor]];
	newTable.delegate = itemTable;
	newTable.rowHeight = CHANNEL_TBL_ROW_HEIGHT;
	// Set the New table view as the table in existing TableViewController
	itemTable.tableView = newTable;
	[newTable release]; 
	
}



// @description - To delete the item info struct before assign new values or at the end
- (void)deleteItemInfo
{
	int i;
	if(itemInfo)
	{
		for(i = 0; i < currItemCount; i++)
		{
			[self deleteNode: itemInfo[i]];
			DEALLOCIF(itemInfo[i]);
		}
		DEALLOCIF(itemInfo);
	}
}



// @description - deletes every additional node created by assigning memory
- (void)deleteNode: (ItemInfo *)node
{
	RELEASEIF(node->guid);
	RELEASEIF(node->title);
	RELEASEIF(node->description);
	RELEASEIF(node->thumbnailUrl);
	RELEASEIF(node->enclosureUrl);
	RELEASEIF(node->itemType);
	RELEASEIF(node->enclosureLength);	
	RELEASEIF(node->thumbImage);
	RELEASEIF(node->loadedThumbImage);
}


// To delete the item info
- (void)deleteTopNewsItemInfo
{
	int i;
	if(topChannelItemInfo)
	{
		for(i = 0; i < currTopNewsItemCount; i++)
		{
			[self deleteNode: topChannelItemInfo[i]];
			DEALLOCIF(topChannelItemInfo[i]);
		}
		DEALLOCIF(topChannelItemInfo);
	}
	
}


// To delete the item info
- (void)deleteBusinessItemInfo
{
	int i;
	if(businessChannelItemInfo)
	{
		for(i = 0; i < currBusinessItemCount; i++)
		{
			[self deleteNode: businessChannelItemInfo[i]];
			DEALLOCIF(businessChannelItemInfo[i]);
		}
		DEALLOCIF(businessChannelItemInfo);
	}	
}


// To delete the item info
- (void)deleteEntertainmentItemInfo
{
	int i;
	if(entertainmentChannelItemInfo)
	{
		for(i = 0; i < currEntertainmentItemCount; i++)
		{
			[self deleteNode: entertainmentChannelItemInfo[i]];
			DEALLOCIF(entertainmentChannelItemInfo[i]);
		}
		DEALLOCIF(entertainmentChannelItemInfo);
	}	
}


// To delete the item info
- (void)deleteSportsItemInfo
{
	int i;
	if(sportsChannelItemInfo)
	{
		for(i = 0; i < currSportsItemCount; i++)
		{
			[self deleteNode: sportsChannelItemInfo[i]];
			DEALLOCIF(sportsChannelItemInfo[i]);
		}
		DEALLOCIF(sportsChannelItemInfo);
	}	
}


// To delete the item info
- (void)deleteCricketItemInfo
{
	int i;
	if(cricketChannelItemInfo)
	{
		for(i = 0; i < currCricketItemCount; i++)
		{
			[self deleteNode: cricketChannelItemInfo[i]];
			DEALLOCIF(cricketChannelItemInfo[i]);
		}
		DEALLOCIF(cricketChannelItemInfo);
	}	
}


// To delete the item info
- (void)deleteFootballItemInfo
{
	int i;
	if(footballChannelItemInfo)
	{
		for(i = 0; i < currFootballItemCount; i++)
		{
			[self deleteNode: footballChannelItemInfo[i]];
			DEALLOCIF(footballChannelItemInfo[i]);
		}
		DEALLOCIF(footballChannelItemInfo);
	}	
}


// To delete the item info
- (void)deleteLifestyleItemInfo
{
	int i;
	if(lifestyleChannelItemInfo)
	{
		for(i = 0; i < currLifeStyleItemCount; i++)
		{
			[self deleteNode: lifestyleChannelItemInfo[i]];
			DEALLOCIF(lifestyleChannelItemInfo[i]);
		}
		DEALLOCIF(lifestyleChannelItemInfo);
	}	
}


// To delete the item info
- (void)deletePeopleItemInfo
{
	int i;
	if(peopleChannelItemInfo)
	{
		for(i = 0; i < currPeopleItemCount; i++)
		{
			[self deleteNode: peopleChannelItemInfo[i]];
			DEALLOCIF(peopleChannelItemInfo[i]);
		}
		DEALLOCIF(peopleChannelItemInfo);
	}	
}


// To delete the item info
- (void)deleteScienceItemInfo
{
	int i;
	if(scienceChannelItemInfo)
	{
		for(i = 0; i < currScienceItemCount; i++)
		{
			[self deleteNode: scienceChannelItemInfo[i]];
			DEALLOCIF(scienceChannelItemInfo[i]);
		}
		DEALLOCIF(scienceChannelItemInfo);
	}	
}


// To delete the item info
- (void)deleteOffbeatItemInfo
{
	int i;
	if(offbeatChannelItemInfo)
	{
		for(i = 0; i < currOffbeatItemCount; i++)
		{
			[self deleteNode: offbeatChannelItemInfo[i]];
			DEALLOCIF(offbeatChannelItemInfo[i]);
		}
		DEALLOCIF(offbeatChannelItemInfo);
	}	
}


// @description - deletes every additional node created by assigning memory
- (void)deleteSlideShowInfo
{
	int i;
	if(slideShowItemInfo)
	{
		for(i = 0; i < totalSlideShowsCount; i++)
		{
			[self deleteNodeSlideshowInfo: slideShowItemInfo[i]];
			DEALLOCIF(slideShowItemInfo[i]);
		}
		DEALLOCIF(slideShowItemInfo);
	}
}




// @description - deletes every additional node created by assigning memory
- (void)deleteNodeSlideshowInfo: (SlideShowInfo *)node
{
	RELEASEIF(node->showName);
	RELEASEIF(node->thumbnailUrl);
	[self deleteSlideItemInfo:node->slideItemInfo];
	RELEASEIF(node->loadedThumbImage);
	RELEASEIF(node->thumbImage);
}



// @description - deletes every additional node created by assigning memory
- (void)deleteSlideItemInfo: (SmallItemInfo **)slideItemInfo
{
	int i;
	if(slideItemInfo)
	{
		for(i = 0; i < totalIteminSlide; i++)
		{
			[self deleteItemNode: slideItemInfo[i]];
			DEALLOCIF(slideItemInfo[i]);
		}
		DEALLOCIF(slideItemInfo);
	}
}



// To delete the galleryItemInfo
- (void)deleteGalleryItemInfo
{
	int i;
	if(galleryItem)
	{
		for(i = 0; i < currGalleryItemCount; i++)
		{
			[self deleteNode: galleryItem[i]];
			DEALLOCIF(galleryItem[i]);
		}
		DEALLOCIF(galleryItem);
	}
}


// delete item info of headlines
- (void)deleteHeadlineItemInfo
{
	int i;
	if(headlinesItemInfo)
	{
		for(i = 0; i < currHeadLinesItemCount; i++)
		{
			[self deleteNode: headlinesItemInfo[i]];
			DEALLOCIF(headlinesItemInfo[i]);
		}
		DEALLOCIF(headlinesItemInfo);
	}
}



// @description - deletes every additional node created by assigning memory
- (void)deleteItemNode: (SmallItemInfo *)node
{
	RELEASEIF(node->title);
	RELEASEIF(node->enclosureUrl);
	RELEASEIF(node->thumbnailUrl);
	RELEASEIF(node->description);
}



// @description - Free all the allocated resources
- (void)dealloc
{
	RELEASEIF(imageDataFromServer);
	RELEASEIF(galleryItemchannelAlias);
	RELEASEIF(galleryItemchannelTitle);
	RELEASEIF(headLineItemchannelAlias);
	RELEASEIF(headLineItemchannelTitle);
	[self deleteNode: searchItem];
	[self deleteItemInfo];
	[self deleteGalleryItemInfo];
	[self deleteHeadlineItemInfo];
	
	[self deleteTopNewsItemInfo];
	[self deleteBusinessItemInfo];
	[self deleteEntertainmentItemInfo];
	[self deleteSportsItemInfo];
	[self deleteCricketItemInfo];
	[self deleteFootballItemInfo];
	[self deleteLifestyleItemInfo];
	[self deletePeopleItemInfo];
	[self deleteScienceItemInfo];
	[self deleteOffbeatItemInfo];
	
	[super dealloc];
}


@end
