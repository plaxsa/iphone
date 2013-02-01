//
//  UpdatesTableViewController.m
//  Umundo
//	@description - Displays the Channel Updates as a Table View
//
//  Created by Y Kamesh Rao on 16/09/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "UpdatesTableViewController.h"
#import "Application.h"
#import "ViewManager.h"
#import "General.h"
#import "ItemCell.h"
#import "MediaPlayerViewController.h"


@implementation UpdatesTableViewController


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad 
{
	// Setting a transparent background color
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	// Setting the header
	UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_HEADER]];
	UIImageView *backdrop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_GRAY_BACK]];
	[backdrop addSubview: header];
	[[[ViewManager viewManager] viewController:UPDATES].view insertSubview:backdrop atIndex:0];
	[super viewDidLoad];
	
	//	// A about button placed to dispaly about screen
//	UIBarButtonItem *aboutBarButton = [[[UIBarButtonItem alloc]
//										initWithTitle:titleAbout
//										style:UIBarButtonItemStyleBordered
//										target:self
//										action:@selector(aboutButtonTouch)] autorelease];
//	self.navigationItem.rightBarButtonItem = aboutBarButton;
}




//@Description - To dispaly the about screen
//- (void)aboutButtonTouch
//{
//	///push createchannel view in the my umundo navigation view
//	[[ViewManager viewManager] createViewController:ABOUT_VIEW];
//	[[ViewManager viewManager] pushViewController: ABOUT_VIEW animated:YES inTheNavigationViewController: UPDATES_NAVIGATION_VIEW];	
//	
//}


- (void)viewWillAppear:(BOOL)animated
{
}


// total Number of section in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 3;
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
			return 75.0;
			break;
	}
}


// Return number of rows in each section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	switch(section)
	{
		case 0:
		{
			return 1;
		}
		break;
			
		// section for updated channels	
		case 1:
		{
			int count = [(UpdatesViewController *)[[ViewManager viewManager] viewController: UPDATES] currUpdatesCount];
			int totalcount = [(UpdatesViewController *)[[ViewManager viewManager] viewController: UPDATES] totalUpdatesCount];
			if ( (totalcount == 0)  && ([(UpdatesViewController *)[[ViewManager viewManager] viewController:UPDATES] updatesMode] == UD_NONE ))
			{
				// if total subscribe channel count is 0 then show msg for no subscribe channel
				[[ViewManager viewManager] showMessage: errorMessageNoUpdates andSetTitle: alertTitleSysResp andDelegateTo: self];
				[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
				return 0;
			}
			else if( (count==0) && ([(UpdatesViewController *)[[ViewManager viewManager] viewController:UPDATES] updatesMode] == UD_NONE ) )
			{
				[[ViewManager viewManager] showMessage: errorMessageNoUpdates andSetTitle: alertTitleSysResp andDelegateTo: self];
				return 0;
			}
			else if(count==0)
			{
				return 1;
			}
			else if(count < UPDATES_COUNT_PER_PAGE)
			{
				self.tableView.rowHeight = CHANNEL_TBL_ROW_HEIGHT;
				return count;
			}
			
			return UPDATES_COUNT_PER_PAGE;
		}
		break;
			
		default:
			return 1;
		break;
	}
	
}


// To dispaly data in the cells of table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	int count = [(UpdatesViewController *)[[ViewManager viewManager] viewController: UPDATES] currUpdatesCount];
	if (count > 0)
	{
		switch (  indexPath.section )
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
				UpdatesViewController *tempHolder = (UpdatesViewController *)[[ViewManager viewManager] viewController: UPDATES];
				static NSString *CellIdentifier = @"UpdatesCell";
				
				ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
				
				if (cell == nil) 
				{
					cell = [[[ItemCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
				}
				
				
				// Populating the Cells
				if(([tempHolder updatesMode] == UD_NONE) && ([tempHolder totalUpdatesCount]))
				{
					ItemInfo *curItem =  [tempHolder updatedItemInfo][indexPath.row]->itemInfo;
					
					CGRect screen = [[UIScreen mainScreen] bounds];
					CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
					cell.frame = itemRect;
					cell.text = nil;
					cell.accessoryView = nil;
					[cell setIsItem:YES];
					// Set the channel and load related data
					[cell setItem: curItem];
				}			
				// Configure the cell
				return cell;			
			}
			break;
			
			default:
			{
				static NSString *MyNewsIdentifier = @"myNewsBlankcellIdentifier";
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyNewsIdentifier];
				if (cell == nil) 
				{
					cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyNewsIdentifier] autorelease];
					cell.selectionStyle = UITableViewCellSelectionStyleNone;
				}
				return cell;
			}
			break;
		}
	}
	else
	{
		static NSString *MyNewsIdentifier = @"myNewsBlankcellIdentifier";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyNewsIdentifier];
		if (cell == nil) 
		{
			cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyNewsIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		return cell;
	}
}




// @description - To Handle the Item selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// set false to make able to hit for ads iamge again
	switch( indexPath.section )
	{
		case 0:
		{
			isTopWebView = NO;
			isClicked = NO;
		}
		break;
		
		// section for channels
		case 1:
		{
			[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			UpdatesViewController *tempHolder = (UpdatesViewController *)[[ViewManager viewManager] viewController: UPDATES];
			
			// Updates are not there
			if([tempHolder updatesMode] != UD_NONE)
			{
				return;
			}
			else if(![tempHolder totalUpdatesCount]) // if no update
			{
				return;
			}
			
			ItemInfo *curItem = [tempHolder updatedItemInfo][indexPath.row]->itemInfo;
			
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
						[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] setIsComefromMyNews:YES];	
						
						
						// Set the Info
						[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getUpdateIteminfodata:[tempHolder updatedItemInfo]];	
						
						// Set the Totalcount
						[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
						
						
						// Set the current page count
						[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[tempHolder currUpdatesCount]];	
						
						
						// Shows the Image
						[(UpdatesViewController *)[[ViewManager viewManager] viewController: UPDATES] presentModalViewController:[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] animated:YES];
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
		break;
			
		default:
		{
		}
		break;
	}	
}


//@description - Top ads display by Web View
-(UITableViewCell *)topAds:(UITableView *)tableView
{
	// UIWebView Used to display google ads at the bottom of the page
	static NSString *SectionIdentifier = @"updatesTopAdsSectionIdentifier";
	
	UITableViewCell *sectionCell = [tableView dequeueReusableCellWithIdentifier:SectionIdentifier];
	if (sectionCell == nil) 
	{
		sectionCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SectionIdentifier] autorelease];
		sectionCell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	// check is it hit for ads image first time or not
	if (isTopWebView == NO )
	{
		isClicked = NO;
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect frame = CGRectMake(0.0,0.0, screen.size.width,CHANNEL_TBL_ROW_HEIGHT- 40 );
		if(updatesWebViewTop)
			[updatesWebViewTop release];
		updatesWebViewTop = [[UIWebView alloc] initWithFrame:frame];
		updatesWebViewTop.backgroundColor = [UIColor clearColor];
		updatesWebViewTop.scalesPageToFit = NO;
		updatesWebViewTop.delegate = self;
		updatesWebViewTop.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
		[updatesWebViewTop loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleTop]]];
		[sectionCell.contentView addSubview:updatesWebViewTop];
		isTopWebView = YES;
	}
	return sectionCell;		
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
				isTopWebView = NO;
				// set the url to be load in web page
				[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
				// Shows the webpage to view ads
				[(UpdatesViewController *)[[ViewManager viewManager] viewController:UPDATES] presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
				
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



// @description - free all the allocated memory
- (void)dealloc 
{
	if(updatesWebViewTop)
		[updatesWebViewTop release];
	[super dealloc];
}


@end

