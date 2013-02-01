//
//  ChannelsTableViewController.m
//  Umundo
//  @description - This class will manage the Channels Table View. One of the most important things
//
//  Created by Y Kamesh Rao on 30/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "ChannelsTableViewController.h"
#import "General.h"
#import "Application.h"
#import "Items.h"
#import "ViewManager.h"


@implementation ChannelsTableViewController


// @description -	Gets called when this view is displayed for the first time. We are using this place to do some initial
//					tasks to provide additional operations on the view
- (void)viewDidLoad
{
	
	// Setting a transparent background color
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	// Setting the header
	UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_HEADER]];
	UIImageView *backdrop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_GRAY_BACK]];
	[backdrop addSubview: header];
	[[[ViewManager viewManager] viewController:CATEGORIES].view insertSubview:backdrop atIndex:1];
    [super viewDidLoad];
}




// @description - Mentions the total number of rows in each column
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 4;
}



// @description - sets the rows in the table	
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	switch ( section )
	{
		case 0: // section for top ads
		{
			return 1;
		}
		break;
		case 1: // section for channels 
		{
			return [self numberOfRows];
		}
		break;
		case 2:
			return 1;
			break;
		default: // section for bottom ads
		{
			return 1;
		}
		break;
	}
}



// @description - Draws the Channel Cells at each table row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{	
	switch ( indexPath.section )
	{
		// section for top ads
		case 0:
		{
			return [ self topAds:tableView];	
			
		}
		break;
		
		// section for channels
		case 1:
		{
			return [ self channelTableView:tableView cellForRowAtIndexPath:indexPath];			
		}
		break;
			
		// section for bottoms ads
		case 2:
		{
			return [ self bottomAds:tableView];	
		}
		break;
			
		default:
		{
			static NSString *CellIdentifier = @"ChannelCellBlank";
			UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			if (cell == nil) 
			{
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
				CGRect screen = [[UIScreen mainScreen] bounds];
				CGRect cellRect = CGRectMake(0.0, 0.0, screen.size.width,CHANNEL_TBL_ROW_HEIGHT-35);
				cell.frame = cellRect;
			}
			
			return cell;
		}
		break;
	}
}




// @description - Load the items of a channel once it is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{	
	// set false to make able to hit for ads iamge again
	isBottomWebView = NO;
	isTopWebView	= NO;
	
	switch ( indexPath.section )
	{
		case 0:
		{
			// section for top ads
		}
		break;
		
		// section for channels
		case 1:
		{
			[self channelTableView:tableView didSelectRowAtIndexPath:indexPath];
		}
		break;
			
		default:
		{
			// section for bottoms ads
		}
		break;
	}
}





// @Description - Delegate Method of UIWebView Class
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	switch ( navigationType )
	{
		// called when user click on the ads link
		case UIWebViewNavigationTypeLinkClicked:
		{
			// set the url to be load in web page
//			[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
			
			// Shows the webpage to view ads
//			[(CategoriesViewController *)[[ViewManager viewManager] viewController: CATEGORIES] presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
						
			return NO;
		}
		break;
	}
	return YES;
}



//@dexcription- returns no of rows
- (NSInteger)numberOfRows
{
	int count = [[[Application application] aChannels] currBrowsingChannelsCount];
	
	self.tableView.rowHeight = CHANNEL_TBL_ROW_HEIGHT;	
	
	// for paging of channel
	int nChannelStartFrom = [(CategoriesViewController *)[[ViewManager viewManager] viewController:CATEGORIES] channelOffset];
	int nTotalCount = [[[Application application] aChannels] totalBrowsingChannels];
	if(count > 0)
		count = count-1;
	if(count == 0)
	{
		[[ViewManager viewManager] showMessage: errorMessageNoChannels andSetTitle: alertTitleSysResp andDelegateTo: self];
		return 0;
	}
	else if(count < CHANNEL_COUNT_PER_PAGE)
	{
		//NSLog(@"returning count = %i", count);
		if ( (nChannelStartFrom - CHANNEL_COUNT_PER_PAGE)  >= 0 )	
		{
			count++; 
		}
		return count;
	}
	
	count = CHANNEL_COUNT_PER_PAGE; 
	
	if ( (nChannelStartFrom - CHANNEL_COUNT_PER_PAGE)  >= 0 )	
	{
		count++; 
	}
	if ( ( nChannelStartFrom + CHANNEL_COUNT_PER_PAGE ) < nTotalCount ) 
	{
		count++;
	}
	
	return count;
}


// @Description - Method to set the height of cells
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch ( indexPath.section )
	{
		case 0:
		{
			// section for top ads
			return 55.0;
		}
			break;
		case 1:
		{
			return 55.0;
		}
			break;
		case 2:
		{
			// section for bottoms ads
			return 55.0;
		}
			break;
		default:
		{
			return 35.0;
		}
		break;
	}
}




//@description - Top ads display
-(UITableViewCell *)topAds:(UITableView *)tableView
{
	// UIWebView Used to display google ads at the bottom of the page
	static NSString *SectionIdentifier = @"newstopAdsSectionIdentifier";
	
	UITableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:SectionIdentifier];
	if (sectionCell == nil) 
	{
		sectionCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SectionIdentifier] autorelease];
	}
	// check is it hit for ads image first time or not
	if (isTopWebView == NO )
	{
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect frame = CGRectMake(0.0,0.0, screen.size.width,CHANNEL_TBL_ROW_HEIGHT-20 );
		if(myWebViewTop)
			[myWebViewTop release];
		myWebViewTop = [[UIWebView alloc] initWithFrame:frame];
		myWebViewTop.backgroundColor = [UIColor clearColor];
		myWebViewTop.scalesPageToFit = NO;
		myWebViewTop.delegate = self;
		myWebViewTop.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
		[myWebViewTop loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleTop]]];
		[sectionCell.contentView addSubview:myWebViewTop];
		isTopWebView = YES;
	}
	return sectionCell;		
}


//@description - Bottom ads display
-(UITableViewCell *)bottomAds:(UITableView *)tableView
{
	// UIWebView Used to display google ads at the bottom of the page
	static NSString *SectionIdentifier = @"newsbottomAdsSectionIdentifier";
	
	UITableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:SectionIdentifier];
	if (sectionCell == nil) 
	{
		sectionCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SectionIdentifier] autorelease];
	}
	
	// check is it hit for ads image first time or not
	if ( isBottomWebView == NO )
	{
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect frame = CGRectMake(0.0,-5, screen.size.width,CHANNEL_TBL_ROW_HEIGHT);
		if(myWebViewBottom)
			[myWebViewBottom release];
		myWebViewBottom = [[UIWebView alloc] initWithFrame:frame];
		myWebViewBottom.backgroundColor = [UIColor clearColor];
		myWebViewBottom.scalesPageToFit = NO;
		myWebViewBottom.delegate = self;
		myWebViewBottom.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
		[myWebViewBottom loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
		[sectionCell.contentView addSubview:myWebViewBottom];
		isBottomWebView = YES;
	}
	return sectionCell;	
}




// @description - Method to return channeltableview
- (UITableViewCell *)channelTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
		static NSString *NewsSlideIdentifier =@"CategoriesChannelCell";
			
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:NewsSlideIdentifier] autorelease];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
		
		ChannelInfo *curChannel = [[[Application application] aChannels] browsingChannels][indexPath.row];
		if(curChannel)
		 cell.text = curChannel->title;
		return cell;
}

	



// @description - Load the items of a channel once it is selected
- (void)channelTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Get the selected channel
	ChannelInfo *curChannel = [[[Application application] aChannels] browsingChannels][indexPath.row];
	
	// Get the local reference for items instance
	Items *items = [[Application application] aItems];
	
	// Set the basic channel details in the item class and call for the items in the channel
	[items setChannelAlias: curChannel->alias];
	[items setChannelTitle: curChannel->title];
	[items setTotalItemCount: [curChannel->itemsCount intValue]];
	[items setItemsMode: II_ITEM];
	[items setOffSetItemCount: 0];
	// Set the Animation view that shows the status that the item fetch is in progress
	[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageClips];
	
	// set NO when clip called first time
	[items setIsSecondTime: NO];
	
	// Get the items by making a http request
	[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT :curChannel->alias : MOBILE_PROFILE_NAME:items];
	
}


//@description - method to set isHitRequested
- (void)setIsHitRequested:(BOOL)value
{
	isHitRequested = value;
}


//@description - method to get isHitRequested
- (BOOL)isHitRequested
{
	return isHitRequested;
}



// @description - Release all memory
- (void)dealloc
{
	if(myWebViewTop)
		[myWebViewTop release];
	if(myWebViewBottom)
		[myWebViewBottom release];
	[super dealloc];
}


@end

