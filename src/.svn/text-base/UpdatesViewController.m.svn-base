//
//  UpdatesViewController.m
//  Umundo
//	@description - Handles the interactions on the Updates View
//
//  Created by Y Kamesh Rao on 28/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "UpdatesViewController.h"
#import "General.h"
#import "Application.h"
#import "FileHandler.h"
#import "ViewManager.h"
#import "Channels.h"
#import "Items.h"

@implementation UpdatesViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
		// Initialization code
		// Create the Buffer to store the data
		responseMutableData = [[NSMutableData alloc] init];
		
		// Setting this ViewControllers TabBarItem since it would be added to a UITabBarController
		UITabBarItem *tabBarItem;
		tabBarItem = [[UITabBarItem alloc] initWithTitle: titleMyNews image: [UIImage imageNamed: ICON_MYNEWS]  tag: 0];
		self.tabBarItem = tabBarItem;			
	}
	return self;
}



// If you need to do additional setup after loading the view, override viewDidLoad.
- (void)viewDidLoad 
{
	// Create the Table View associated with this view
	[[ViewManager viewManager] createTableViewController: UPDATES_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: titleMyNews andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
	
	// Move the control to the table to show the updates
	[[ViewManager viewManager] createNavigationViewController: UPDATES_NAVIGATION_VIEW andInitWithRootViewController: UPDATES_TABLE_VIEW];
	
	// Add the view to the Updates View
	[[ViewManager viewManager] addViewOfController: UPDATES_NAVIGATION_VIEW overTheViewOfController: UPDATES];
	
}



- (void)viewWillAppear:(BOOL)animated
{
	// Display the ads image at the bottom of the screen
	CGRect screen = [[UIScreen mainScreen] bounds];
	CGRect frame = CGRectMake(0.0,382, screen.size.width,38);
	if(updatesWebViewFooter)
		RELEASEIF(updatesWebViewFooter);
	updatesWebViewFooter = [[UIWebView alloc] initWithFrame:frame];
	updatesWebViewFooter.backgroundColor = [UIColor darkGrayColor];
	updatesWebViewFooter.scalesPageToFit = NO;
	updatesWebViewFooter.delegate = self;
	updatesWebViewFooter.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
	[updatesWebViewFooter loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
	[self.view addSubview:updatesWebViewFooter];
	
	isClicked = NO;
}


// @Description - Delegate Method of UIWebView Class
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	switch ( navigationType )
	{
			// called when user click on the ads link
		case UIWebViewNavigationTypeLinkClicked:
		{	
			if ( isClicked == NO )
			{
				// set the url to be load in web page
				[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
				
				// Shows the webpage to view ads
				[self presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
				isClicked = YES;
				return YES;
			}
			else
				return NO;
		}
			break;
			
		case UIWebViewNavigationTypeOther:
			return YES;
			break;
	}
	return NO;
}




// To set the requset hot again
- (void)setIsSubscribeNewChannels:(BOOL)value
{
	isSubscribeNewChannels = value;
}



// @desctiption - If the View already appeared then we need to start fetching the updates
- (void)viewDidAppear: (BOOL)animated
{
	if(isSubscribeNewChannels == NO)
	{
		// Lets make the request to check for updates
		[self syncSubscriptionsAndFetchFromBackendIfNeccessary: YES];
	}
}



// @description - Set the Updates Mode
- (void)setUpdatesMode: (UpdatesMode) mode
{
	updatesMode = mode;
}



// @description - Set if the update check is done
- (void)setUpdateCheckDone: (BOOL)value
{
	isUpdateCheckDone = value;
}



// @description - Get the Update Check done status
- (BOOL)isUpdateCheckDone
{
	return isUpdateCheckDone;
}



// @description - Get the Updates Mode
- (UpdatesMode)updatesMode
{
	return updatesMode;
}



// @description - Get the updated Item Info data
- (UpdatedItemInfo **)updatedItemInfo
{
	return updatedItemInfo;
}



// @description - Get the Updates Count
- (int)currUpdatesCount
{
	return currUpdatesCount;
}



// @description - Return the total Updates count
- (int)totalUpdatesCount
{
	return totalUpdatesCount;
}



// @description - Synch the user channel subscriptions from the backend
- (void)syncSubscriptionsAndFetchFromBackendIfNeccessary: (BOOL)loadFromNet
{
	Channels *tempChannel = [[Application application] aChannels];
	
	// Remove the message view
	if([[ViewManager viewManager] isMessageDisplayed])
		[[ViewManager viewManager] removeMessage];
	[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
	
	// Set the Updates View Controller as the  
	[tempChannel setChannelViewControllerDelegate: self];
	
	// Before we setup the view to display the Channels..lets get the user subscriptions
	// from the backend if they are already not cached on the iPhone
	FileHandler *tempFH = [FileHandler new];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *subscriptionsInfoPath = [documentsDirectory stringByAppendingPathComponent:SUBSCRIPTIONS_FILE_NAME];

	// if subscription is already exist then get theupdates from them, else default channel will be subscribed for user
	if( [tempFH IsFileExists: subscriptionsInfoPath] )	
	{
		// Load the data and make a call to parser method
		NSData *subscriptions = [tempFH ReadFileContent: subscriptionsInfoPath];
		
		NSString* SubscribedChannels;
		NSString *newData;
		SubscribedChannels = [[NSString alloc] initWithData:subscriptions encoding:NSASCIIStringEncoding];
		int count = [SubscribedChannels length];
		// if no contents in file exist then do the default channel as a subscribe channel
		if ( count > 0 )
		{
			if ( [SubscribedChannels hasSuffix:@","])
			{
				newData = [SubscribedChannels substringToIndex:count-1];
			}
			NSArray *channelAliases = [[[NSArray alloc] init] autorelease];
			channelAliases= [newData componentsSeparatedByString:@","];
			[SubscribedChannels release];
			// Get the number of updated items if any since this date
			updatesMode = UD_UPDATES_COUNT;
			[[[Application application] aHttpRequest] getNumberOfUpdatedItemsByInterval: channelAliases: DAYS_IN_SECONDS:self];
			
			// This part of code would normally get executed the second time on once the subscriptions are synched with the backend
			// from the point the featured channels are fetched and loaded and then we need not check for updates again once this view loads.
			isUpdateCheckDone = YES;
						
		}
		else
		{
			NSMutableArray *channelAliases = [[[NSMutableArray alloc] init] autorelease];
			
			// if no channel is subscribed then default subscriptions for user
			for(int i= 0; i< 2; i++)
			{
				if ( i == 0)
					[channelAliases addObject: ENTERTAINMENT_ALIAS];
				else
					[channelAliases addObject: SPORTS_ALIAS];	
			}
			
			NSMutableString *channelAliasesForFile = [[NSMutableString alloc] initWithCapacity:500] ;
			[channelAliasesForFile appendString: ENTERTAINMENT_ALIAS];
			[channelAliasesForFile appendString: @","];
			[channelAliasesForFile appendString: SPORTS_ALIAS];
			[channelAliasesForFile appendString: @","];
			
			NSData* aData;
			aData = [channelAliasesForFile dataUsingEncoding: NSASCIIStringEncoding];
			
			if( [tempFH IsFileExists: subscriptionsInfoPath] )	
				[tempFH RemoveFile: subscriptionsInfoPath];
			
			if( ![tempFH IsFileExists: subscriptionsInfoPath] )	
			{
				// Store the User Info strcture
				[tempFH WriteToFile:subscriptionsInfoPath :aData :nil];
			}
			
			
			[(SubscribeViewController *)[[ViewManager viewManager] viewController: SUBSCRIBE_VIEW]setDefaultSwitchOn];
			
			[channelAliasesForFile release];
			// Get the number of updated items if any since this date
			updatesMode = UD_UPDATES_COUNT;
			[[[Application application] aHttpRequest] getNumberOfUpdatedItemsByInterval: channelAliases: DAYS_IN_SECONDS:self];		
		}	
		
	}
	else 
	{
		NSMutableArray *channelAliases = [[[NSMutableArray alloc] init] autorelease];
		
		// if no channel is subscribed then default subscriptions for user
		for(int i= 0; i< 2; i++)
		{
			if ( i == 0)
			[channelAliases addObject: ENTERTAINMENT_ALIAS];
			else
			[channelAliases addObject: SPORTS_ALIAS];	
		}
		
		NSMutableString *channelAliasesForFile = [[NSMutableString alloc] initWithCapacity:500] ;
		[channelAliasesForFile appendString: ENTERTAINMENT_ALIAS];
		[channelAliasesForFile appendString: @","];
		[channelAliasesForFile appendString: SPORTS_ALIAS];
		[channelAliasesForFile appendString: @","];
		
		NSData* aData;
		aData = [channelAliasesForFile dataUsingEncoding: NSASCIIStringEncoding];
		
		if( [tempFH IsFileExists: subscriptionsInfoPath] )	
			[tempFH RemoveFile: subscriptionsInfoPath];
		
		if( ![tempFH IsFileExists: subscriptionsInfoPath] )	
		{
			// Store the User Info strcture
			[tempFH WriteToFile:subscriptionsInfoPath :aData :nil];
		}
		
		[channelAliasesForFile release];		
		
		// Get the number of updated items if any since this date
		updatesMode = UD_UPDATES_COUNT;
		[[[Application application] aHttpRequest] getNumberOfUpdatedItemsByInterval: channelAliases: DAYS_IN_SECONDS:self];		
	}	
	
	[tempFH release];
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}



// hides alert sheet or popup. use this method when you need to explicitly dismiss the alert.
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	switch(buttonIndex)
	{
		case 0:
			// Remove the message view
			if([[ViewManager viewManager] isMessageDisplayed])
				[[ViewManager viewManager] removeMessage];
			updatesMode = UD_NONE;
			break;
		case 1:
			switch(updatesMode)
			{		
				case UD_NONE:
				break;
				case UD_UPDATES_COUNT:
					[self syncSubscriptionsAndFetchFromBackendIfNeccessary: YES];
				break;
				case UD_UPDATES_ITEMS:
					// Remove the message view
					if([[ViewManager viewManager] isMessageDisplayed])
						[[ViewManager viewManager] removeMessage];
					[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
					[self  getChannelAliasandRequestforItems];	
				break;
			}
	}
}



// If any network error occured
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error  
{  
	
	// Remove the message view
	if([[ViewManager viewManager] isMessageDisplayed])
		[[ViewManager viewManager] removeMessage];
	
	switch(updatesMode)
	{		
		case UD_NONE:
			break;
			
		case UD_UPDATES_COUNT:
		case UD_UPDATES_ITEMS:
			[[ViewManager viewManager] showMessageWithRetry: errorMessageNetFail andSetTitle: errorTitleSysErr andDelegateTo: self];
			break;
	}
}  



// Request for update according to channel alias
- (void)getChannelAliasandRequestforItems
{
	// Make the request to fetch the updates..in case there are any available
	if(totalUpdatesCount)
	{
		FileHandler *tempFH = [FileHandler new];
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *subscriptionsInfoPath = [documentsDirectory stringByAppendingPathComponent:SUBSCRIPTIONS_FILE_NAME];
		
		if( [tempFH IsFileExists: subscriptionsInfoPath] )	
		{
			NSArray *channelAliases = [[[NSArray alloc] init] autorelease];
			// Load the data and make a call to parser method
			NSData *subscriptions = [tempFH ReadFileContent: subscriptionsInfoPath];
			
			NSString* SubscribedChannels;
			NSString *newData;
			SubscribedChannels = [[NSString alloc] initWithData:subscriptions encoding:NSASCIIStringEncoding];
			int count = [SubscribedChannels length];
			if ( count > 0 )
			{
				if ( [SubscribedChannels hasSuffix:@","])
				{
					newData = [SubscribedChannels substringToIndex:count-1];
				}
				
				channelAliases= [newData componentsSeparatedByString:@","];
				[SubscribedChannels release];
				
				updatesMode = UD_UPDATES_ITEMS;
				[[[Application application] aHttpRequest] getUpdatedItemsByInterval: channelAliases : DAYS_IN_SECONDS : MOBILE_PROFILE_NAME : TYPE_RECENT : 0 : (totalUpdatesCount>UPDATES_COUNT_PER_PAGE? UPDATES_COUNT_PER_PAGE: totalUpdatesCount):self];					
			}
			else
			{
				NSMutableArray *channelAliases = [[[NSMutableArray alloc] init] autorelease];
				for(int i= 0; i< 2; i++)
				{
					if ( i == 0)
						[channelAliases addObject: ENTERTAINMENT_ALIAS];
					else
						[channelAliases addObject: SPORTS_ALIAS];	
				}
				NSMutableString *channelAliasesForFile = [[NSMutableString alloc] initWithCapacity:500] ;
				[channelAliasesForFile appendString: ENTERTAINMENT_ALIAS];
				[channelAliasesForFile appendString: @","];
				[channelAliasesForFile appendString: SPORTS_ALIAS];
				[channelAliasesForFile appendString: @","];
				
				NSData* aData;
				aData = [channelAliasesForFile dataUsingEncoding: NSASCIIStringEncoding];
				
				if( [tempFH IsFileExists: subscriptionsInfoPath] )	
					[tempFH RemoveFile: subscriptionsInfoPath];
				
				if( ![tempFH IsFileExists: subscriptionsInfoPath] )	
				{
					// Store the User Info strcture
					[tempFH WriteToFile:subscriptionsInfoPath :aData :nil];
				}
				
				[channelAliasesForFile release];		
				
				updatesMode = UD_UPDATES_ITEMS;
				[[[Application application] aHttpRequest] getUpdatedItemsByInterval: channelAliases : DAYS_IN_SECONDS : MOBILE_PROFILE_NAME : TYPE_RECENT : 0 : (totalUpdatesCount>UPDATES_COUNT_PER_PAGE? UPDATES_COUNT_PER_PAGE: totalUpdatesCount):self];					
			}
			
		}
		else 
		{
			NSMutableArray *channelAliases = [[[NSMutableArray alloc] init] autorelease];
			for(int i= 0; i< 2; i++)
			{
				if ( i == 0)
					[channelAliases addObject: ENTERTAINMENT_ALIAS];
				else
					[channelAliases addObject: SPORTS_ALIAS];	
			}
			NSMutableString *channelAliasesForFile = [[NSMutableString alloc] initWithCapacity:500] ;
			[channelAliasesForFile appendString: ENTERTAINMENT_ALIAS];
			[channelAliasesForFile appendString: @","];
			[channelAliasesForFile appendString: SPORTS_ALIAS];
			[channelAliasesForFile appendString: @","];
			
			NSData* aData;
			aData = [channelAliasesForFile dataUsingEncoding: NSASCIIStringEncoding];
			
			if( [tempFH IsFileExists: subscriptionsInfoPath] )	
				[tempFH RemoveFile: subscriptionsInfoPath];
			
			if( ![tempFH IsFileExists: subscriptionsInfoPath] )	
			{
				// Store the User Info strcture
				[tempFH WriteToFile:subscriptionsInfoPath :aData :nil];
			}
			
			[channelAliasesForFile release];		
			
			updatesMode = UD_UPDATES_ITEMS;
			[[[Application application] aHttpRequest] getUpdatedItemsByInterval: channelAliases : DAYS_IN_SECONDS : MOBILE_PROFILE_NAME : TYPE_RECENT : 0 : (totalUpdatesCount>UPDATES_COUNT_PER_PAGE? UPDATES_COUNT_PER_PAGE: totalUpdatesCount):self];					
		}	
		
		[tempFH release];
	}	
}



// Get the data from the server  which is requested
- (void)connectionDidFinishLoading:(NSURLConnection *)connection  
{  
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	// Parse the received data
	switch(updatesMode)
	{		
		case UD_NONE:
		{
			
		}
		break;	
		case UD_UPDATES_COUNT:
		{
 			NSString *responseData = [[NSString alloc] initWithData:responseMutableData encoding:NSASCIIStringEncoding];
			SBJSON *json = [SBJSON new];
			id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
			id error = [responseJSON objectForKey:@"error"];
			
			if( [error isKindOfClass:[NSNull class]] )	
			{
				NSNumber *tempNum;
				ASSIGNNUMBER(responseJSON, @"result", tempNum); 
				totalUpdatesCount = [tempNum intValue];
				
				// Make the request to fetch the updates..in case there are any available
				if(totalUpdatesCount)
				{
					[self getChannelAliasandRequestforItems];
				}
				else
				{
					updatesMode = UD_NONE;
					// Set the number as the Badge Value for this View
					self.tabBarItem.badgeValue = [tempNum stringValue];
					// Reload the data for the Updated Items Table View
					UpdatesTableViewController *tempHolder = (UpdatesTableViewController *)[[ViewManager viewManager] viewController: UPDATES_TABLE_VIEW];
					UITableView *updatesTableView = tempHolder.tableView;
					[updatesTableView reloadData];
				}
		
			}
			else
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
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
			
			[responseData release];
			[json release]; 	
		}
		break;
			
		case UD_UPDATES_ITEMS:
		{
			NSString *responseData = [[NSString alloc] initWithData:responseMutableData encoding:NSASCIIStringEncoding];
			SBJSON *json = [SBJSON new];
			
			id responseJSON = [json objectWithString:responseData allowScalar:YES error:NULL];
			id error = [responseJSON objectForKey:@"error"];
			
			if( [error isKindOfClass:[NSNull class]] )	
			{
				id result = [responseJSON objectForKey:@"result"];
				
				// Releasing the existing ItemInfo structure
				[self deleteItemInfo];
				isSubscribeNewChannels = YES;
				NSUInteger count = [result count];
				currUpdatesCount = count;
				updatedItemInfo = (UpdatedItemInfo **) malloc(sizeof(UpdatedItemInfo*[count]));
				
				NSString *string = [NSString stringWithFormat:@"%d", count];
				// Set the number as the Badge Value for this View
				self.tabBarItem.badgeValue = string;
				
				for(int i = 0; i < count; i++)
				{
					updatedItemInfo[i] = (UpdatedItemInfo *) malloc(sizeof(UpdatedItemInfo));
					updatedItemInfo[i]->itemInfo = (ItemInfo*) malloc(sizeof(ItemInfo));
					id updatedItemNode = [result objectAtIndex:i];
					id objAtIndex = [updatedItemNode objectForKey: @"item"];					
										
					ASSIGNSTRING(objAtIndex, @"guid", updatedItemInfo[i]->itemInfo->guid);		
					ASSIGNSTRING(objAtIndex, @"title", updatedItemInfo[i]->itemInfo->title);	
					ASSIGNSTRING(objAtIndex, @"description", updatedItemInfo[i]->itemInfo->description);	
					ASSIGNSTRING(objAtIndex, @"thumbnailUrl", updatedItemInfo[i]->itemInfo->thumbnailUrl);	
					ASSIGNSTRING(objAtIndex, @"enclosureUrl", updatedItemInfo[i]->itemInfo->enclosureUrl);	
					ASSIGNSTRING(objAtIndex, @"type", updatedItemInfo[i]->itemInfo->itemType);	
					
					ASSIGNNUMBER(objAtIndex, @"enclosureLength", updatedItemInfo[i]->itemInfo->enclosureLength);	
					
					// Capitalize the thing s that matter
					[updatedItemInfo[i]->itemInfo->title capitalizedString];
					
					
					RETAIN(updatedItemInfo[i]->itemInfo->guid);
					RETAIN(updatedItemInfo[i]->itemInfo->title);
					RETAIN(updatedItemInfo[i]->itemInfo->description);
					RETAIN(updatedItemInfo[i]->itemInfo->thumbnailUrl);
					RETAIN(updatedItemInfo[i]->itemInfo->enclosureUrl);
					RETAIN(updatedItemInfo[i]->itemInfo->itemType);
					RETAIN(updatedItemInfo[i]->itemInfo->enclosureLength);
					
					updatedItemInfo[i]->itemInfo->thumbImage = nil;
					updatedItemInfo[i]->itemInfo->loadedThumbImage = nil;
				}
				
				// Indicating that no network activity is in progress in the backend
				updatesMode = UD_NONE;
				
				// Reload the data for the Updated Items Table View
				UpdatesTableViewController *tempHolder = (UpdatesTableViewController *)[[ViewManager viewManager] viewController: UPDATES_TABLE_VIEW];
				UITableView *updatesTableView = tempHolder.tableView;
				[updatesTableView reloadData];
				
				
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
			}
			else
			{
				// Remove the message view
				if([[ViewManager viewManager] isMessageDisplayed])
					[[ViewManager viewManager] removeMessage];
				
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
			
			[responseData release];
			[json release]; 	
		}
		break;			
	}
	
	[connection release];
	
}  
	



// @description - To delete the item info struct before assign new values or at the end
- (void)deleteItemInfo
{
	int i;
	if(updatedItemInfo)
	{
		for(i = 0; i < currUpdatesCount; i++)
		{
			[self deleteNode: updatedItemInfo[i]->itemInfo];
			DEALLOCIF(updatedItemInfo[i]->itemInfo);
			DEALLOCIF(updatedItemInfo[i]);
		}
		DEALLOCIF(updatedItemInfo);
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




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response  
{  
	if ((updatesMode == UD_NONE) && (prevUpdatesMode == UD_THUMBNAIL_START))
	{
		// Initialise the mutable data object
		RELEASEIF(imageDataFromServer);
		imageDataFromServer = [[NSMutableData alloc] init];
	}
	else
	{
		[responseMutableData setLength: 0];
		[responseMutableData setData: nil];
	}
}  



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  
{  
	if ((updatesMode == UD_NONE) && (prevUpdatesMode == UD_THUMBNAIL_START))
	{
		[imageDataFromServer appendData:data];
	}
	else
	{
		[responseMutableData appendData: data];
	}
}


// Free all the allocated memory by the class
- (void)dealloc 
{
	if(updatesWebViewFooter)
		RELEASEIF(updatesWebViewFooter);
	RELEASEIF(imageDataFromServer);
	[self deleteItemInfo];
	[responseMutableData release];
	[super dealloc];
}


@end
