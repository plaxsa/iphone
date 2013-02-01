//
//  GalleryItemTableViewController.m
//  MyNews
// @Description - To dispaly Videos and Slide Shows in the table
//  Created by ANKUR AGARWAL on 19/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "GalleryItemTableViewController.h"
#import "ItemCell.h"
#import "General.h"
#import "Application.h"
#import "ViewManager.h"
#import "SmallItemCell.h"


@implementation GalleryItemTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style])
	{
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad 
{
	// Setting a transparent background color
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_HEADER]];
	UIImageView *backdrop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_GRAY_BACK]];
	[backdrop addSubview: header];
	[[[ViewManager viewManager] viewController:GALLERY_VIEW].view insertSubview:backdrop atIndex:0];
	
	[super viewDidLoad];	
}


// set the count for section of table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 5;
}



// Set the number of rows in the table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    switch ( section )
	{
		case 0:
			return 1;
		break;
		case 1:
			return 1;
		break;
		case 2:
			return [self numberOfRowsforslideshow];
		break;
		case 3:
			return [self numberOfRows];
			break;
		default:
			return 1;
		break;
	}
}


//@dexcription- returns no of rows
- (NSInteger)numberOfRows
{
	int count = [[[Application application] aItems] currGalleryItemCount];
	// for paging of Item
	int nItemStartFrom = [[[Application application] aItems] offsetGalleryItemCount];
	int nTotalCount = [[[Application application] aItems] totalGalleryItemCount];
	
	if(count==0)
	{
		return 1;
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
	
	if ( (nItemStartFrom - ITEMS_COUNT_PER_PAGE)  >= 0 )	
	{
		count++; 
	}
	if ( ( nItemStartFrom + ITEMS_COUNT_PER_PAGE ) < nTotalCount ) 
	{
		count++;
	}
	
	return count;	
}




//@dexcription- returns number of rows
- (NSInteger)numberOfRowsforslideshow
{
	int count = [[[Application application] aItems] totalSlideShowsCount];
	if(count == 0)
	{
		return 1;
	}	
	
	return count ;	
}




// Set the UIView on the hedaer o section to look much batter view, using gray color lable to dispaly the header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	int Slidescount = [[[Application application] aItems] totalSlideShowsCount];
	int Videoscount = [[[Application application] aItems] currGalleryItemCount];
	if ( Slidescount > 0 ||  Videoscount > 0 )
	{
		if ( section == 2)
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];			
			UILabel *label;
			label = [[UILabel alloc] initWithFrame:CGRectMake(5 ,5, screen.size.width, 15)];
			label.font = [UIFont boldSystemFontOfSize:15.0];
			label.textAlignment = UITextAlignmentLeft;
			label.textColor = [UIColor whiteColor];
			label.backgroundColor = [UIColor clearColor];
			label.text = SLIDE_SHOW_TITLE;
			[sectionView addSubview:label];
			return sectionView;
		}
		
		else if ( section == 3)
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			UILabel *label;
			label = [[UILabel alloc] initWithFrame:CGRectMake(5 ,5, screen.size.width, 15)];
			label.font = [UIFont boldSystemFontOfSize:15.0];
			label.textAlignment = UITextAlignmentLeft;
			label.textColor = [UIColor whiteColor];
			label.backgroundColor = [UIColor clearColor];
			label.text = VIDEOS_TITLE;
			[sectionView addSubview:label];
			return sectionView;
		}
	}
	return nil;
	
}



// To dispalythe Items in table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int Slidescount = [[[Application application] aItems] totalSlideShowsCount];
	int Videoscount = [[[Application application] aItems] currGalleryItemCount];
	if ( Slidescount > 0 ||  Videoscount > 0 )
	{
		switch(indexPath.section)
		{
			case 0:
			{
				static NSString *GalleryIdentifier = @"galleryBlankcellIdentifier";
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GalleryIdentifier];
				if (cell == nil) 
				{
					cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:GalleryIdentifier] autorelease];
					cell.selectionStyle = UITableViewCellSelectionStyleNone;
				}
				return cell;
			}
				break;
				
			// section for top ads
			case 1:
			{
				return [self topAds:tableView];			
			}
				break;
				
				// section for clips
			case 2:
			{
				int count = [[[Application application] aItems] totalSlideShowsCount];
				if ( count > 0 )
					return [self itemTableView:tableView cellForRowAtIndexPathforslideshow:indexPath];
				else
				{
					static NSString *SlideIdentifier = @"SlidegalleryBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SlideIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SlideIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;
				}
			}
			break;
				
			case 3:
			{
				int count = [[[Application application] aItems] currGalleryItemCount];
				if ( count > 0 )
					return [self itemTableView:tableView cellForRowAtIndexPath:indexPath];
				else
				{
					static NSString *VideoIdentifier = @"VideogalleryBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VideoIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:VideoIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;
				}
			}
			break;
				
				// section for bottoms ads
			default:
			{
				//return [self bottomAds:tableView];	
				static NSString *GalleryIdentifier = @"galleryBlankcellIdentifier";
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GalleryIdentifier];
				if (cell == nil) 
				{
					cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:GalleryIdentifier] autorelease];
					cell.selectionStyle = UITableViewCellSelectionStyleNone;
				}
				return cell;
			}
				break;
		}
	}
	else
	{
		static NSString *GalleryIdentifier = @"galleryBlankcellIdentifier";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GalleryIdentifier];
		if (cell == nil) 
		{
			cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:GalleryIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		return cell;
	}
}



// handle event when cell get selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch(indexPath.section)
	{
		case 0:
		{
			// section for top ads
		}
		break;
		
		case 1:
		{
			isTopWebView	= NO;
			isClicked = NO;
		}
		break;
			
			// section for clips
		case 2:
		{
			int count = [[[Application application] aItems] totalSlideShowsCount];
			if ( count > 0 )
			{
				[self itemTableView:tableView didSelectRowAtIndexPathforSlideShow:indexPath];
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
		case 3:
		{
			int count = [[[Application application] aItems] currGalleryItemCount];
			if ( count > 0 )
			{
				[self itemTableView:tableView didSelectRowAtIndexPath:indexPath];
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
				
			}
		}
		break;
			
		default:
		{
			// section for bottom ads
		}
			break;
	}	
}






//@description - Top ads display
-(UITableViewCell *)topAds:(UITableView *)tableView
{
	// UIWebView Used to display google ads at the bottom of the page
	static NSString *SectionIdentifier = @"myGalleryTopItemSectionIdentifier";
	
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
		CGRect frame = CGRectMake(0.0,0.0, screen.size.width,CHANNEL_TBL_ROW_HEIGHT-40);
		if(myGalleryWebViewTop)
			[myGalleryWebViewTop release];
		myGalleryWebViewTop = [[UIWebView alloc] initWithFrame:frame];
		myGalleryWebViewTop.backgroundColor = [UIColor clearColor];
		myGalleryWebViewTop.scalesPageToFit = NO;
		myGalleryWebViewTop.delegate = self;
		myGalleryWebViewTop.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
		[myGalleryWebViewTop loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleTop]]];
		[sectionCell.contentView addSubview:myGalleryWebViewTop];
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
			if (isClicked == NO )
			{
				isTopWebView = NO;
				// set the url to be load in web page
				[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
				
				// Shows the webpage to view ads
				[(GalleryViewController *)[[ViewManager viewManager] viewController: GALLERY_VIEW] presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
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




// @Description - Method to set the height of cells
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

		switch ( indexPath.section )
		{
			case 0:
			{
				return 45.0;
			}	
				break;
			case 1:
			{
				// section for top ads
				return 35.0;
			}
				break;
			case 2:
			{
				// section for top ads
				return 75.0;
			}
				break;	
			case 3:
			{
				// section for top ads
				return 75.0;
			}
				break;	
			default:
			{
				// section for bottoms ads
				return 45.0;
			}
				break;
		}
}




// @description - Method to return itemtableview
- (UITableViewCell *)itemTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"GalleryItemCell";
	ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
	{
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
		cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
	}
	
	ItemInfo *curItem = [[[Application application] aItems] GalleryItemInfo][indexPath.row];
	
	// Set the channel and load related data
	[cell setIsItem:YES];
	[cell setItem: curItem];	
	
	// Configure the cell
	return cell;
}




// @description - Method to return itemtableview
- (UITableViewCell *)itemTableView:(UITableView *)tableView cellForRowAtIndexPathforslideshow:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"GallerySlideShowItemCell";
	SmallItemCell *cell = (SmallItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
	{
		CGRect screen = [[UIScreen mainScreen] bounds];
		CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
		cell = [[[SmallItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
	}
	
	{
		SlideShowInfo *curItem = [[[Application application] aItems] getSlideShowInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
	}
	
	// Configure the cell
	return cell;
}




// @description - Load the items of a item once it is selected
- (void)itemTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	ItemInfo *curItem = [[[Application application] aItems] GalleryItemInfo][indexPath.row];
	
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
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] GalleryItemInfo]];	
				
				// Set the Totalcount
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
				
				
				// Set the current page count
				[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currGalleryItemCount]];	
				
				
				
				// Shows the Image
				[(GalleryViewController *)[[ViewManager viewManager] viewController: GALLERY_VIEW] presentModalViewController:[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] animated:YES];
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




// @description - Load the items of a item once it is selected
- (void)itemTableView:(UITableView *)tableView didSelectRowAtIndexPathforSlideShow:(NSIndexPath *)indexPath
{
	//To display the slide show on the click, with play,pause,and scrolling option
	SlideShowInfo *curItem = [[[Application application] aItems] getSlideShowInfo][indexPath.row];
	int counttemp = [curItem->totalItems intValue]; 
	
	[(SlideshowViewController *)[[ViewManager viewManager] viewController:SLIDE_SHOW_VIEW] setItemInfoCount:counttemp];
	
	[(SlideshowViewController *)[[ViewManager viewManager] viewController:SLIDE_SHOW_VIEW] setItemInfoForImages:curItem->slideItemInfo];
	
	[(GalleryViewController *)[[ViewManager viewManager] viewController: GALLERY_VIEW] presentModalViewController:[[ViewManager viewManager] viewController:SLIDE_SHOW_VIEW] animated:YES];

}


// free all the memory
- (void)dealloc 
{
	if (myGalleryWebViewTop)
		[myGalleryWebViewTop release];
    [super dealloc];
}


@end

