//
//  ItemTableViewController.m
//  Umundo
//	@description - This class will manage the Item Table View of the class
//
//  Created by Y Kamesh Rao on 04/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "ItemTableViewController.h"
#import "ItemCell.h"
#import "General.h"
#import "Application.h"
#import "ViewManager.h"
#import "CategoriesTableViewController.h"


@implementation ItemTableViewController



// @description -	Gets called when this view is displayed for the first time. We are using this place to create the
//					future  view controllers
- (void)viewDidLoad
{
	// Setting a transparent background color
	[self.view setBackgroundColor:[UIColor clearColor]];
		
	[super viewDidLoad];
}


// @description - To set the current item count
- (void)setCurrentItemCount:(int)count
{
	currItemCount = count;
}


// @description - To set the current offset of item count
- (void)setCurrentOffsetCount:(int)count
{
	currOffsetCount = count;
}


// @description - To set the total item count
- (void)setTotalItemCount:(int)count
{
	currTotalCount = count;
}


// @description - To set the iteminfo to view
- (void)setItemInfo:(ItemInfo**)info
{
	currItemInfo = info;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 4;
}



// @description - sets the rows in the table	
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	switch ( section )
	{
			// section for blank cell
		case 0:
		{
			return 1;
		}
			break;
			
			// section for top ads	
		case 1:
		{
			return [self numberOfRows];
		}
			break;
		// section for bottom ads
		default:
		{
			return 1;
		}
			break;
	}	
}



// @description - Draws the Channel Cells at each table row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	int count = currItemCount;//[[[Application application] aItems] currItemCount];
	if ( count > 0 )
	{
		switch(indexPath.section)
		{
				// section for top ads
			case 0:
			{
				return [self topAds:tableView];			
			}
				break;
				
				// section for clips
			case 1:
			{
				return [self itemTableView:tableView cellForRowAtIndexPath:indexPath];			
			}
				break;
				
			default:
			{
				static NSString *HeadlineIdentifier = @"NewsBlankcellIdentifier";
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeadlineIdentifier];
				if (cell == nil) 
				{
					cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:HeadlineIdentifier] autorelease];
					cell.selectionStyle = UITableViewCellSelectionStyleNone;
				}
				return cell;
			}
				break;
		}
	}
	else
	{
		static NSString *HeadlineIdentifier = @"NewsBlankcellIdentifier";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeadlineIdentifier];
		if (cell == nil) 
		{
			cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:HeadlineIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		return cell;
	}
	
}



// @description - Load the items of a channel once it is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// set false to make able to hit for ads iamge again
	switch(indexPath.section)
	{
		case 0:
		{
			isTopWebView = NO;
			isClicked = NO;
			// section for top ads
		}
			break;
			
			// section for clips
		case 1:
		{
			// for paging of Item
			[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			[self itemTableView:tableView didSelectRowAtIndexPath:indexPath];			
		}
			break;
			
		default:
		{
			// section for bottom ads
		}
			break;
	}
}



// @Description - Method to set the height of cells
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch ( indexPath.section )
	{
		case 0:
		{
			// section for top ads
			return 35.0;
		}
			break;
		case 1:
		{
			return 75.0;
		}
			break;
		default:
			return 35.0;
			break;
	}
}





// hides alert sheet or popup. use this method when you need to explicitly dismiss the alert.
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
		// if there is no clip then pop up the item table view
		int count = currItemCount;
		if( count == 0 )
		{
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] popViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		}
		else
		{
			// when enclosure length is zero
		}
	}
}



//@dexcription- returns number of rows
- (NSInteger)numberOfRows
{
	int count = currItemCount;
	int nItemStartFrom = currOffsetCount;
	int nTotalCount = currTotalCount;
	
	if ( nTotalCount )
	{
		if( count == 0)
		{
			[[ViewManager viewManager] showMessage: errorMessageNoClips andSetTitle: alertTitleSysResp andDelegateTo: self];
			return 0;
		}
		else if(count < ITEMS_COUNT_PER_PAGE)
		{
			if ( (nItemStartFrom - ITEMS_COUNT_PER_PAGE)  >= 0 )	
			{
				count++; 
			}
			return count;
		}
		
		count = ITEMS_COUNT_PER_PAGE; 
		
	}
	return count;	
}



//@description - Top ads display
-(UITableViewCell *)topAds:(UITableView *)tableView
{
	// UIWebView Used to display google ads at the bottom of the page
	static NSString *SectionIdentifier = @"newsItemSectionIdentifier";
	
	UITableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:SectionIdentifier];
	if (sectionCell == nil) 
	{
		sectionCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SectionIdentifier] autorelease];
		sectionCell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	// check is it hit for ads image first time or not
	if (isTopWebView == NO )
	{
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect frame = CGRectMake(0.0,0.0, screen.size.width,CHANNEL_TBL_ROW_HEIGHT-40);
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





// @Description - Delegate Method of UIWebView Class
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	//NSLog(@"channel shouldStartLoadWithRequest");
	switch ( navigationType )
	{
			// called when user click on the ads link
		case UIWebViewNavigationTypeLinkClicked:
		{
			if ( isClicked == NO )
			{
			isTopWebView = NO;
			// set the url to be load in web page
			[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
			
			// Shows the webpage to view ads
			[(CategoriesViewController *)[[ViewManager viewManager] viewController: CATEGORIES] presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
			
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




// @description - Method to return itemtableview
- (UITableViewCell *)itemTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"NewsItemCell";
	ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
	{
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
		cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
	}
	
	ItemInfo *curItem = currItemInfo[indexPath.row];
		
	// Set the channel and load related data
	[cell setIsItem:YES];
	[cell setItem: curItem];	
	
	// Configure the cell
	return cell;
}


// @description - Load the items of a item once it is selected
- (void)itemTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	//ItemInfo *curItem = [[[Application application] aItems] itemInfo][indexPath.row];
	ItemInfo *curItem = currItemInfo[indexPath.row];
	
	if (curItem->enclosureLength.intValue > 0)
	{
		if( [curItem->itemType isEqualToString: @"audio"] || [curItem->itemType isEqualToString: @"video"] )
		{
			MediaPlayerViewController *temp = (MediaPlayerViewController *)[[ViewManager viewManager] viewController: MEDIA_PLAYER_VIEW];
			
			// Set the URL of the media file to be played
			[temp setMovieURL:curItem->enclosureUrl];
			[temp initMoviePlayer];
			
			MediaPlayerViewController *tempMPC = (MediaPlayerViewController*)[[ViewManager viewManager] viewController:MEDIA_PLAYER_VIEW];
			[tempMPC playMovie];
			
		}
		else
		{
			// if size is greater then 700 kb open in web browser
			if (curItem->enclosureLength.intValue < MAX_IMAGE_SIZE_CAN_DISPLAY)
			{
				
				// Set the Image URL
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] setUrlOfImageToBeDrawn: curItem->enclosureUrl];
				
				// Set the thumb Image URL
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] setThumbUrlOfImageToBeDrawn: curItem->thumbnailUrl];
				
				
				// Set the Title
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] setImageTitle:curItem->title];	
				
				// Set the Description
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] setDescription:curItem->description];	
				
				// Set the come from which sceen
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] setIsComefromMyNews:NO];	
				
				
				// Set the Info
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata: currItemInfo];	
				
				
				// Set the Totalcount
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
				
				
				// Set the current page count
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:currItemCount];	
				
				
				// Shows the Image
				[(CategoriesViewController *)[[ViewManager viewManager] viewController: CATEGORIES] presentModalViewController:[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] animated:YES];
				
			}
			else
			{
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:curItem->enclosureUrl]];
			}
		}
	}
	else
	{
		// set the msg that length is zero
		[[ViewManager viewManager] showMessage:errorMessageLengthZero andSetTitle:errorTitleFormVal andDelegateTo: self];
	}

}



- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
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


// free all the memory
- (void)dealloc
{
	if(myWebViewTop)
		[myWebViewTop release];
	[super dealloc];
}

@end

