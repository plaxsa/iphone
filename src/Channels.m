//
//  Channels.m
//  Umundo
//  description  - Class To handle the request and response of the channels
//  Created by Y Kamesh Rao on 23/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "Channels.h"
#import "General.h"
#import "ViewManager.h"
#import "CommonUtils.h"
#import "Application.h"

@implementation Channels


- (id)init
{
	if([super init] != nil)
	{

	}
	
	return self;
}


// set the channel delegate 
- (void)setChannelViewControllerDelegate: (id)delegate
{
	channelViewControllerDelegate = delegate;
}


// set the curr browsing id
- (void)setCurrBrowsingCategoryID: (NSString *)category
{
	currBrowsingCategoryID = category;
}


// set the current browsing filter
- (void)setCurrBrowsingFilter: (NSString *)filter
{
	currBrowsingFilter = filter;
}



// set the channel mode to make request
- (void)setChannelsMode: (ChannelsMode)mode
{
	channelsMode=mode;
}



// Get the requested channel mode
- (ChannelsMode)channelsMode
{
	return channelsMode;
}



// Get the total browsing channel count
- (int)totalBrowsingChannels
{
	return totalBrowsingChannels;
}


// To get the current browsing channel count
- (int)currBrowsingChannelsCount
{
	return currBrowsingChannelsCount;
}


// Set the current browsing category 
- (NSString *)currBrowsingCategoryID
{
	return currBrowsingCategoryID;
}


// set the current browsing filter
- (NSString *)currBrowsingFilter
{
	return currBrowsingFilter;
}


// Get the browsing channel info
- (ChannelInfo **)browsingChannels
{
	return browsingChannels;
}


// hides alert sheet or popup. use this method when you need to explicitly dismiss the alert.
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if ( buttonIndex == 0 )
	{
		if([[ViewManager viewManager] isMessageDisplayed])
			[[ViewManager viewManager] removeMessage];
	}
	else if ( buttonIndex == 1 )
	{
		switch(channelsMode)
		{
				
			case CI_BROWSING:
			case CI_BROWSING_COUNT:
			{
				CategoriesViewController* categories = (CategoriesViewController *)[[ViewManager viewManager] viewController:CATEGORIES];
				[categories retryHTTPRequest];
			}
			break;
		}
	}
	
}


//	@description - There was an error connecting to the server
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error  
{  
	if([[ViewManager viewManager] isMessageDisplayed])
		[[ViewManager viewManager] removeMessage];
	
	switch(channelsMode)
	{
		case CI_BROWSING:
		{
			[[ViewManager viewManager] showMessageWithRetry: errorMessageNetFail andSetTitle: errorTitleSysErr andDelegateTo: self];
		}
		break;
		
		case CI_BROWSING_COUNT:
		{
			[[ViewManager viewManager] showMessageWithRetry: errorMessageNetFail andSetTitle: errorTitleSysErr andDelegateTo: self];
		}
		break;
	}
	
	
	[super connection:connection didFailWithError: error];
}



// To get the server response
- (void)connectionDidFinishLoading: (NSURLConnection *)connection 
{  
	
	NSData *receivedData = [NSData dataWithBytes:[responseMutableData mutableBytes] length:[responseMutableData length]];
	switch(channelsMode)
	{
		case CI_BROWSING_COUNT:
		{
			[self parseReceivedDataToGetCount:receivedData];
		}
		break;
			
		case CI_BROWSING:
		{
			[self parseReceivedData:receivedData];
		}
		break;
	}
	
	[super connectionDidFinishLoading:connection];
}  


// @description - To parse the recived response from the server to get total counts
- (void)parseReceivedDataToGetCount : (NSData *)response
{
	NSString *responseData = [[[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding] autorelease];
	SBJSON *json = [[[SBJSON init] alloc] autorelease];
	id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
	id error = [responseJSON objectForKey:@"error"];
	
	if( [error isKindOfClass:[NSNull class]] )
	{
		NSNumber *tempHolder;
		ASSIGNNUMBER(responseJSON, @"result", tempHolder);
		int tempTotal = [tempHolder intValue];
		
		switch(channelsMode)
		{
			case CI_BROWSING_COUNT:
			{
				totalBrowsingChannels	=	tempTotal;
				if (totalBrowsingChannels > MAX_CHANNEL_CLIP_VISIBLE)
					totalBrowsingChannels = MAX_CHANNEL_CLIP_VISIBLE;
			}
			break;
		}
		
		// Return the focus to the Calling View Controllers delegated method
		[channelViewControllerDelegate updateViewOnReceivingChannelsCount];
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
		
	}
	
}


// @description - To parse the recived response from the server
- (void)parseReceivedData : (NSData *)response
{
	NSString *responseData = [[[NSString alloc] initWithData:response encoding:NSASCIIStringEncoding] autorelease];
	SBJSON *json = [[[SBJSON init] alloc] autorelease];
	
	id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
	id error = [responseJSON objectForKey:@"error"];
	
	if( [error isKindOfClass:[NSNull class]] )
	{
		// Remove the message view
		if([[ViewManager viewManager] isMessageDisplayed])
			[[ViewManager viewManager] removeMessage];
		
		ChannelInfo **tempChannels;
		ChannelInfo **tempBrowseChannels;

		id result = [responseJSON objectForKey:@"result"];
		int count = [result count];
		
		// Making mem alloc for temp pointer of channel info
		tempChannels = (ChannelInfo**)malloc(sizeof(ChannelInfo)*count);
		// Making mem alloc for temp pointer of channel info
		tempBrowseChannels = (ChannelInfo**)malloc(sizeof(ChannelInfo)*count);
		for ( int i = 0; i < count; i++)
		{
				// Getting the current index position of the arry in struct
				id objAtIndex = [result objectAtIndex:i];
				tempChannels[i]=(ChannelInfo*)malloc(sizeof(ChannelInfo));
				tempChannels[i]->thumbnailUrl = NULL;
				// Data storing	tempStr		
				ASSIGNSTRING(objAtIndex, @"alias", tempChannels[i]->alias);
				ASSIGNSTRING(objAtIndex, @"title", tempChannels[i]->title);
				ASSIGNSTRING(objAtIndex, @"thumbnailUrl", tempChannels[i]->thumbnailUrl);
				if( [tempChannels[i]->thumbnailUrl isEqualToString:@""])
				{
					tempChannels[i]->thumbnailUrl = NULL;
				}
				ASSIGNSTRING(objAtIndex, @"description", tempChannels[i]->description);
				ASSIGNNUMBER(objAtIndex, @"itemCount", tempChannels[i]->itemsCount);

				// Capitalize the thing s that matter
				[tempChannels[i]->title capitalizedString];			
				[tempChannels[i]->owner capitalizedString];
				
				RETAIN(tempChannels[i]->alias);
				RETAIN(tempChannels[i]->title);
				RETAIN(tempChannels[i]->description);
				RETAIN(tempChannels[i]->thumbnailUrl);
				RETAIN(tempChannels[i]->itemsCount);
							
				// Set the thumbnail image to be nil
				tempChannels[i]->thumbImage = nil;
				tempChannels[i]->loadedThumbImage = nil;
				tempChannels[i]->isThumbnailDone = NO;
			if (channelsMode == CI_BROWSING )
			{
				int j = 0;
				if ([tempChannels[i]->alias isEqualToString:TOPNEWS_ALIAS])
				{
					j = 9;
				}
				else if ([tempChannels[i]->alias isEqualToString:SPORTS_ALIAS])
				{
					j = 2;
				}
				
				else if ([tempChannels[i]->alias isEqualToString:SCIENCE_ALIAS])
				{
					j = 7;
				}
				
				else if ([tempChannels[i]->alias isEqualToString:PEOPLE_ALIAS])
				{
					j = 6;
				}
				else if ([tempChannels[i]->alias isEqualToString:OFFBEAT_ALIAS])
				{
					j = 8;
				}
				else if ([tempChannels[i]->alias isEqualToString:LIFESTYLE_ALIAS])
				{
					j = 5;
				}
				else if ([tempChannels[i]->alias isEqualToString:FOOTBALL_ALIAS])
				{
					j = 4;
				}
				else if ([tempChannels[i]->alias isEqualToString:CRICKET_ALIAS])
				{
					j = 3;
				}
				else if ([tempChannels[i]->alias isEqualToString:BUSINESS_ALIAS])
				{
					j = 0;
				}
				else if ([tempChannels[i]->alias isEqualToString:ENTERTAINMENT_ALIAS])
				{
					j = 1;
				}
				
				
				// Getting the current index position of the arry in struct
				id objAtIndex = [result objectAtIndex:i];
				tempBrowseChannels[j]=(ChannelInfo*)malloc(sizeof(ChannelInfo));
				tempBrowseChannels[j]->thumbnailUrl = NULL;
				// Data storing	tempStr		
				ASSIGNSTRING(objAtIndex, @"alias", tempBrowseChannels[j]->alias);
				ASSIGNSTRING(objAtIndex, @"title", tempBrowseChannels[j]->title);
				ASSIGNSTRING(objAtIndex, @"thumbnailUrl", tempBrowseChannels[j]->thumbnailUrl);
				if( [tempBrowseChannels[j]->thumbnailUrl isEqualToString:@""])
				{
					tempBrowseChannels[j]->thumbnailUrl = NULL;
				}
				ASSIGNSTRING(objAtIndex, @"description", tempBrowseChannels[j]->description);
				ASSIGNNUMBER(objAtIndex, @"itemCount", tempBrowseChannels[j]->itemsCount);
				
				// Capitalize the thing s that matter
				[tempBrowseChannels[j]->title capitalizedString];			
				[tempBrowseChannels[j]->owner capitalizedString];
				
				RETAIN(tempBrowseChannels[j]->alias);
				RETAIN(tempBrowseChannels[j]->title);
				RETAIN(tempBrowseChannels[j]->description);
				RETAIN(tempBrowseChannels[j]->thumbnailUrl);
				RETAIN(tempBrowseChannels[j]->itemsCount);
				
				// Set the thumbnail image to be nil
				tempBrowseChannels[j]->thumbImage = nil;
				tempBrowseChannels[j]->loadedThumbImage = nil;
				tempBrowseChannels[j]->isThumbnailDone = NO;
				
			}

		}
		switch(channelsMode)
		{
			case CI_BROWSING:
				{
					// Remove the message being displayed during this communication
					if([[ViewManager viewManager] isMessageDisplayed])
						[[ViewManager viewManager] removeMessage];
					
					if(browsingChannels)
					{
						for(int i = 0; i < currBrowsingChannelsCount; i++)
						{
							[self deleteNode: browsingChannels[i]];
							DEALLOCIF(browsingChannels[i]);
						}
						DEALLOCIF(browsingChannels);
					}
					
					// Copy the newly created ChannelInfo array structure into browsed channels
					browsingChannels = tempBrowseChannels;
					currBrowsingChannelsCount = count;
					prevChannelMode = CI_BROWSING;
					
					// Return the focus to the Calling View Controllers delegated method
					if ( iscategoriesChannelViewTableCreated == NO )
					{
						// Create the Channel Table View Controller
						[[ViewManager viewManager] createTableViewController: CHANNEL_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: titleNews andRowHeight: CHANNEL_TBL_ROW_HEIGHT];	
						
						// Create the Channel Navigation View Controller and add the Channel Table View to the Navigation View
						[[ViewManager viewManager] createNavigationViewController: CATEGORIES_NAVIGATION_VIEW andInitWithRootViewController: CHANNEL_TABLE_VIEW];
						
						// Add the Channel Navigation View Controller over the Watch View Controller
						[[ViewManager viewManager] addViewOfController: CATEGORIES_NAVIGATION_VIEW overTheViewOfController: CATEGORIES];	
						
						iscategoriesChannelViewTableCreated = YES;
						
					}
					else
					{
						// Return the focus to the Calling View Controllers delegated method
						[channelViewControllerDelegate updateViewOnReceivingChannels];
					}
					
				}
				break;				
		}
		
		// Reset the Mode to NONE indicating no activity
		channelsMode = CI_NONE;
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




// @description - deletes every additional node created by assigning memory
- (void)deleteNode: (ChannelInfo *)node
{
	RELEASEIF(node->alias);
	RELEASEIF(node->title);
	RELEASEIF(node->description);
	RELEASEIF(node->thumbnailUrl);
	RELEASEIF(node->itemsCount);
	RELEASEIF(node->thumbImage);
	RELEASEIF(node->loadedThumbImage);
}



// @description - Free subscriptions once the updates are done
- (void)deleteBrowsingChannels;
{
	if(browsingChannels)
	{
		for(int i=0; i<currBrowsingChannelsCount; i++)
		{
			[self deleteNode: browsingChannels[i]];
			DEALLOCIF(browsingChannels[i]);
		}
		DEALLOCIF(browsingChannels);
	}	
}


// @description - Delete the entire memory assgined by this class
- (void)dealloc
{
	RELEASEIF(currBrowsingFilter);
	RELEASEIF(currBrowsingCategoryID);
	RELEASEIF(imageDataFromServer);
	[self deleteBrowsingChannels];
	[super dealloc];
}

@end
