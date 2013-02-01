//
//  CategoriesTableViewController.m
//  Umundo
//  @description - This class will manage the News Channel Table View. This calss is use only when we  will dispaly 
//					items and categories both in a same table with more option
//  Created by Ankur Agarwal on 24/11/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "CategoriesTableViewController.h"
#import "ItemCell.h"
#import "General.h"
#import "Application.h"
#import "ViewManager.h"



@implementation CategoriesTableViewController

// @description -	Gets called when this view is displayed for the first time. We are using this place to create the
//					future  view controllers
- (void)viewDidLoad
{
	// Setting a transparent background color
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	// Setting the header
	UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_HEADER]];
	UIImageView *backdrop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_GRAY_BACK]];
	[backdrop addSubview: header];
	[[[ViewManager viewManager] viewController:CATEGORIES].view insertSubview:backdrop atIndex:0];
	
    [super viewDidLoad];
}



// set the total number of section in tha table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 13;
}



// @description - sets the rows in the table	
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	switch ( section )
	{
			// section for top ads
		case 0:
		{
			return 1;
		}
			break;
			
		case 1:
		{
			return 1;
		}
			break;
			
			// section for clips	
		case 2:
		{
			return [self numberOftopNewsChannelRows];
		}
			break;
			// section for clips	
		case 3:
		{
			return [self numberOfBusinessChannelRows];	
		}
			break;
			// section for clips	
		case 4:
		{
			return [self numberOfEntertainmentChannelRows];	
		}
			break;
			// section for clips	
		case 5:
		{
			return [self numberOfSportsChannelRows];	
		}
			break;
			
			// section for clips	
		case 6:
		{
			return [self numberOfCricketChannelRows];	
		}
			break;
			
			// section for clips	
		case 7:
		{
			return [self numberOfFootballChannelRows];	
		}
			break;
			// section for clips	
		case 8:
		{
			return [self numberOfLifestyleChannelRows];	
		}
			break;
			
			// section for clips	
		case 9:
		{
			return [self numberOfPeopleChannelRows];	
		}
			break;
			
			// section for clips	
		case 10:
		{
			return [self numberOfOffbeatChannelRows];	
		}
			break;
			
			// section for clips	
		case 11:
		{
			return [self numberOfBusinessChannelRows];	
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
	int count = [[[Application application] aItems] currOffbeatItemCount];
	if ( count > 0 )
	{
		switch(indexPath.section)
		{
				// section for blank cell
			case 0:
			{
				static NSString *HeadlineIdentifier = @"NewsTabBlankcellIdentifier";
				
				UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeadlineIdentifier];
				if (cell == nil) 
				{
					cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:HeadlineIdentifier] autorelease];
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
				int count = [[[Application application] aItems] currTopNewsItemCount];
				if (count > 0 ) 
					return [self itemTableView:tableView topnewscellForRowAtIndexPath:indexPath];
				else
				{
					static NSString *TopNewsIdentifier = @"TopNewsTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TopNewsIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:TopNewsIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;
				}
				
			}
				break;
				
				// section for clips
			case 3:
			{
				int count = [[[Application application] aItems] currBusinessItemCount];
				if (count > 0 ) 
					return [self itemTableView:tableView businesscellForRowAtIndexPath:indexPath];
				else
				{
					static NSString *BusinessIdentifier = @"BusinessTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BusinessIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:BusinessIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
			}
				break;
				
				// section for clips
			case 4:
			{
				int count = [[[Application application] aItems] currEntertainmentItemCount];
				if (count > 0 ) 
					return [self itemTableView:tableView entertainmentcellForRowAtIndexPath:indexPath];			
				else
				{
					static NSString *EntertainmentIdentifier = @"EntertainmentTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:EntertainmentIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:EntertainmentIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
			}
				break;
				
				// section for clips
			case 5:
			{
				int count = [[[Application application] aItems] currSportsItemCount];
				if (count > 0 ) 
					return [self itemTableView:tableView sportscellForRowAtIndexPath:indexPath];	
				else
				{
					static NSString *SportsIdentifier = @"SportsTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SportsIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:SportsIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
			}
				break;
				
				// section for clips
			case 6:
			{
				int count = [[[Application application] aItems] currCricketItemCount];
				if (count > 0 ) 
					return [self itemTableView:tableView cricketcellForRowAtIndexPath:indexPath];	
				else
				{
					static NSString *CricketIdentifier = @"CricketTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CricketIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CricketIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
			}
				break;
				
				
				// section for clips
			case 7:
			{
				int count = [[[Application application] aItems] currFootballItemCount];
				if (count > 0 )
					return [self itemTableView:tableView footballcellForRowAtIndexPath:indexPath];	
				else
				{
					static NSString *FootballIdentifier = @"FootballTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FootballIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:FootballIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
			}
				break;
				
				
				// section for clips
			case 8:
			{
				int count = [[[Application application] aItems] currLifeStyleItemCount];
				if (count > 0 )
					return [self itemTableView:tableView lifestylecellForRowAtIndexPath:indexPath];
				else
				{
					static NSString *LifeStyleIdentifier = @"LifestyleTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LifeStyleIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:LifeStyleIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
				
			}
				break;
				
				
				// section for clips
			case 9:
			{
				int count = [[[Application application] aItems] currPeopleItemCount];
				if (count > 0 )
					return [self itemTableView:tableView peoplecellForRowAtIndexPath:indexPath];	
				else
				{
					static NSString *PeopleIdentifier = @"PeopleTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PeopleIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:PeopleIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
				
			}
				break;
				
				
				// section for clips
			case 10:
			{
				int count = [[[Application application] aItems] currScienceItemCount];
				if (count > 0 )
					return [self itemTableView:tableView sciencecellForRowAtIndexPath:indexPath];
				else
				{
					static NSString *ScienceIdentifier = @"ScienceTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ScienceIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:ScienceIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
			}
				break;
				
				
				// section for clips
			case 11:
			{
				int count = [[[Application application] aItems] currOffbeatItemCount];
				if (count > 0 )
					return [self itemTableView:tableView offbeatcellForRowAtIndexPath:indexPath];
				else
				{
					static NSString *OffbeatIdentifier = @"OffbeatTabBlankcellIdentifier";
					
					UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OffbeatIdentifier];
					if (cell == nil) 
					{
						cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:OffbeatIdentifier] autorelease];
						cell.selectionStyle = UITableViewCellSelectionStyleNone;
					}
					return cell;					
				}
			}
				break;
				
				// draw blank cell
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
		// draw blank cell
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
		case 1:
		{
			isTopWebView = NO;
			isClicked = NO;
			// section for top ads
		}
			break;
			
			// section for clips
		case 2:
		{
			int count = [[[Application application] aItems] currTopNewsItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView topnewsdidSelectRowAtIndexPath:indexPath];
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			// section for clips
		case 3:
		{
			int count = [[[Application application] aItems] currBusinessItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView businessdidSelectRowAtIndexPath:indexPath];	
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			// section for clips
		case 4:
		{
			int count = [[[Application application] aItems] currEntertainmentItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView entertainmentdidSelectRowAtIndexPath:indexPath];	
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			// section for clips
		case 5:
		{
			int count = [[[Application application] aItems] currSportsItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView sportsdidSelectRowAtIndexPath:indexPath];		
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			// section for clips
		case 6:
		{
			int count = [[[Application application] aItems] currCricketItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView cricketdidSelectRowAtIndexPath:indexPath];	
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			// section for clips
		case 7:
		{
			int count = [[[Application application] aItems] currFootballItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView footballdidSelectRowAtIndexPath:indexPath];	
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			// section for clips
		case 8:
		{
			int count = [[[Application application] aItems] currLifeStyleItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView lifestyledidSelectRowAtIndexPath:indexPath];			
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			
			// section for clips
		case 9:
		{
			int count = [[[Application application] aItems] currPeopleItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView peopledidSelectRowAtIndexPath:indexPath];	
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			// section for clips
		case 10:
		{
			int count = [[[Application application] aItems] currScienceItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView sciencedidSelectRowAtIndexPath:indexPath];		
				[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
			}
		}
			break;
			
			
			// section for clips
		case 11:
		{
			int count = [[[Application application] aItems] currOffbeatItemCount];
			if (count > 0 )
			{
				[self itemTableView:tableView offbeatdidSelectRowAtIndexPath:indexPath];	
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




// Set the UIView on the hedaer o section to look much batter view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	
	CGRect screen = [[UIScreen mainScreen] bounds];
	UILabel *label;
	label = [[UILabel alloc] initWithFrame:CGRectMake(5 ,5, screen.size.width, 15)];
	label.font = [UIFont boldSystemFontOfSize:15.0];
	label.textAlignment = UITextAlignmentLeft;
	label.textColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	
	int count = [[[Application application] aItems] currOffbeatItemCount];
	if ( count > 0 )
	{
		if ( section == 2)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			
			label.text = TOPNEWS_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 3)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			
			label.text = BUSINESS_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 4)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			
			label.text = ENTERTAINMENT_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 5)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];		
			
			label.text = SPORTS_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 6)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];	
			
			label.text = CRICKET_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 7)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];	
			
			label.text = FOOTBALL_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 8)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			
			label.text = LIFESTYLE_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 9)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			
			
			label.text = PEOPLE_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 10)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			
			label.text = SCIENCE_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}
		else if (section == 11)
		{
			CGRect sectionFrame = CGRectMake(0, 0, 0, 0);
			UIView* sectionView = [[UIView alloc] initWithFrame: sectionFrame];
			UIImageView* sectionImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SECTION_HEADER] ];
			sectionView.clipsToBounds = NO;
			[sectionView addSubview: sectionImage];
			
			label.text = OFFBEAT_CHANNEL_NAME;
			[sectionView addSubview:label];
			return sectionView;
		}		
	}
	return nil;
	
}




// @Description - Method to set the height of cells
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch ( indexPath.section )
	{
		case 0:
			return 40.0;
		break;
		case 1:
		{
			// section for top ads
			return 35.0;
		}
			break;
			
		case 12:
		{
			return 52.0;
		}
			break;
			
		default:
		{
			if (indexPath.row == 2)
				return 40.0;
			return 75.0;
		}
			break;
	}
}


//@description - Top ads display by web view
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
		isClicked = NO;
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




// number of rows in top news channel section
- (NSInteger)numberOftopNewsChannelRows
{
	int count = [[[Application application] aItems] currTopNewsItemCount];	
	if (count > 3)
		return 3;
	return count;
}


// number of rows in business section
- (NSInteger)numberOfBusinessChannelRows
{
	int count = [[[Application application] aItems] currBusinessItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in entertainment section
- (NSInteger)numberOfEntertainmentChannelRows
{
	int count = [[[Application application] aItems] currEntertainmentItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in sports section
- (NSInteger)numberOfSportsChannelRows
{
	int count = [[[Application application] aItems] currSportsItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in cricket section
- (NSInteger)numberOfCricketChannelRows
{
	int count = [[[Application application] aItems] currCricketItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in football section
- (NSInteger)numberOfFootballChannelRows
{
	int count = [[[Application application] aItems] currFootballItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in lifestyle section
- (NSInteger)numberOfLifestyleChannelRows
{
	int count = [[[Application application] aItems] currLifeStyleItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in people section
- (NSInteger)numberOfPeopleChannelRows
{
	int count = [[[Application application] aItems] currPeopleItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in science section
- (NSInteger)numberOfScienceChannelRows
{
	int count = [[[Application application] aItems] currScienceItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}


// number of rows in offbeat section
- (NSInteger)numberOfOffbeatChannelRows
{
	int count = [[[Application application] aItems] currOffbeatItemCount];
	if (count == 0) return 1;
	if (count > 3)
		return 3;
	return count;
}




// cell for top news item display
- (UITableViewCell *)itemTableView:(UITableView *)tableView topnewscellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"topnewscellForRowAtIndexPath");
		static NSString *CellIdentifier = @"TopnewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
			
		}
		
		ItemInfo *curItem = [[[Application application] aItems] gettopChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		// Configure the cell
		return cell;
	}
	else
	{
		
		static NSString *NewsSlideIdentifier =@"TopBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
		
	}
	
}



// vell for business item display
- (UITableViewCell *)itemTableView:(UITableView *)tableView businesscellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"businesscellForRowAtIndexPath");
		static NSString *CellIdentifier = @"BusinessNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getbusinessChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;
	}
	else
	{
		
		static NSString *NewsSlideIdentifier =@"BusinessBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
	}
}



// cell for entertainment item display
- (UITableViewCell *)itemTableView:(UITableView *)tableView entertainmentcellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		static NSString *CellIdentifier = @"EntertainmentNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		//ItemInfo **item
		ItemInfo *curItem = [[[Application application] aItems] getentertainmentChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"EntertainmentBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;				
	}
	
}


// cell for sports item dispaly
- (UITableViewCell *)itemTableView:(UITableView *)tableView sportscellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"sportscellForRowAtIndexPath");
		static NSString *CellIdentifier = @"SportsNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getsportsChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;	
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"SportsBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
	}
}


// cell for cricket item display
- (UITableViewCell *)itemTableView:(UITableView *)tableView cricketcellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"cricketcellForRowAtIndexPath");
		static NSString *CellIdentifier = @"CricketNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getcricketChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;	
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"CricketBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
	}
	
}


// cell for football item display
- (UITableViewCell *)itemTableView:(UITableView *)tableView footballcellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"footballcellForRowAtIndexPath");
		static NSString *CellIdentifier = @"FootballNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getfootballChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;	
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"FootballBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
		
	}
	
}


// cell for lifestyle item display
- (UITableViewCell *)itemTableView:(UITableView *)tableView lifestylecellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"lifestylecellForRowAtIndexPath");
		static NSString *CellIdentifier = @"LifestyleNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getlifestyleChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"LifestyleBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
	}
}


// cell for people section items dispaly
- (UITableViewCell *)itemTableView:(UITableView *)tableView peoplecellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"peoplecellForRowAtIndexPath");
		static NSString *CellIdentifier = @"PeopleNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getpeopleChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"PeopleBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
	}
	
}


// cell for science sction item display
- (UITableViewCell *)itemTableView:(UITableView *)tableView sciencecellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"sciencecellForRowAtIndexPath");
		static NSString *CellIdentifier = @"ScienceNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getscienceChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"ScienceBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
		
	}
}


// cell for offbeat section item dispaly
- (UITableViewCell *)itemTableView:(UITableView *)tableView offbeatcellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		//NSLog(@"offbeatcellForRowAtIndexPath");
		static NSString *CellIdentifier = @"OffbeatNewsItemCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:CellIdentifier] autorelease];
		}
		
		ItemInfo *curItem = [[[Application application] aItems] getoffbeatChannelItemInfo][indexPath.row];
		
		// Set the channel and load related data
		[cell setIsItem:YES];
		[cell setItem: curItem];	
		
		// Configure the cell
		return cell;
	}
	else
	{
		static NSString *NewsSlideIdentifier =@"OffbeatBlankChannelCell";
		ItemCell *cell = (ItemCell *)[tableView dequeueReusableCellWithIdentifier:NewsSlideIdentifier];
		if (cell == nil) 
		{
			CGRect screen = [[UIScreen mainScreen] bounds];
			CGRect itemRect = CGRectMake(0.0, 0.0, screen.size.width, CHANNEL_TBL_ROW_HEIGHT);
			cell = [[[ItemCell alloc] initWithFrame:itemRect reuseIdentifier:NewsSlideIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
		
		// Set the channel and load related data
		[cell setIsItem:NO];
		[cell setText:MoreOption];
		// Configure the cell
		return cell;		
	}
	
}



// When accessory button will click on cell then handle event
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	switch(indexPath.section)
	{
		case 2:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: TOPNEWS_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currTopNewsItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] gettopChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
		}
			break;
			
		case 3:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: BUSINESS_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currBusinessItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getbusinessChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
		}
			break;
			
		case 4:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: ENTERTAINMENT_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currEntertainmentItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getentertainmentChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
		}
			break;
			
		case 5:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: SPORTS_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currSportsItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getsportsChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
			
		}
			break;
			
		case 6:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: CRICKET_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currCricketItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getcricketChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
		}
			break;
			
		case 7:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: FOOTBALL_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currFootballItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getfootballChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
		}
			break;
			
		case 8:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: LIFESTYLE_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currLifeStyleItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getlifestyleChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
		}
			break;
			
		case 9:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: PEOPLE_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currPeopleItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getpeopleChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
		}
			break;
			
		case 10:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: SCIENCE_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currScienceItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getscienceChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
			
			
		}
			break;
			
		case 11:
		{
			// Create the required views
			[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
			[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: OFFBEAT_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
			
			ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
			[itemTable setCurrentItemCount:[[[Application application] aItems]currOffbeatItemCount]];
			[itemTable setCurrentOffsetCount:0];
			[itemTable setTotalItemCount:10];
			[itemTable setItemInfo:[[[Application application] aItems] getoffbeatChannelItemInfo]];
			
			// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
			[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		}
			break;
			
	}
	
}



// selection event handle in top news section
- (void)itemTableView:(UITableView *)tableView topnewsdidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] gettopChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] gettopChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currTopNewsItemCount]];	
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: TOPNEWS_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currTopNewsItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] gettopChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
	
}


// selection event handle in business section
- (void)itemTableView:(UITableView *)tableView businessdidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getbusinessChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getbusinessChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currBusinessItemCount]];	
					
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: BUSINESS_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currBusinessItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getbusinessChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
}


// selection event handle in
- (void)itemTableView:(UITableView *)tableView entertainmentdidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getentertainmentChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getentertainmentChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currEntertainmentItemCount]];	
					
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: ENTERTAINMENT_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currEntertainmentItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getentertainmentChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
	
}


// selection event handle in sports section
- (void)itemTableView:(UITableView *)tableView sportsdidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getsportsChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getsportsChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currSportsItemCount]];	
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: SPORTS_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currSportsItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getsportsChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
	
}


// selection event handle in cricket section
- (void)itemTableView:(UITableView *)tableView cricketdidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getcricketChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getcricketChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currCricketItemCount]];	
					
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: CRICKET_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currCricketItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getcricketChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
	
}


// selection event handle in football section
- (void)itemTableView:(UITableView *)tableView footballdidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getfootballChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getfootballChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currFootballItemCount]];	
					
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: FOOTBALL_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currFootballItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getfootballChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
}


// selection event hndle in lifestyle section
- (void)itemTableView:(UITableView *)tableView lifestyledidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getlifestyleChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getlifestyleChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currLifeStyleItemCount]];	
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: LIFESTYLE_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currLifeStyleItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getlifestyleChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
}


// selection event hndle in people section
- (void)itemTableView:(UITableView *)tableView peopledidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getpeopleChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getpeopleChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currPeopleItemCount]];	
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: PEOPLE_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currPeopleItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getpeopleChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
}


// selection event hndle in science section
- (void)itemTableView:(UITableView *)tableView sciencedidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getscienceChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getscienceChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currScienceItemCount]];	
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: SCIENCE_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currScienceItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getscienceChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
	}
	
}


// selection event hndle in offbeat section
- (void)itemTableView:(UITableView *)tableView offbeatdidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2)
	{
		ItemInfo *curItem = [[[Application application] aItems] getoffbeatChannelItemInfo][indexPath.row];
		
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
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] getIteminfodata:[[[Application application] aItems] getoffbeatChannelItemInfo]];	
					
					// Set the Totalcount
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] currentItemCount:indexPath.row];	
					
					
					// Set the current page count
					[(NewsDetailViewController *)[[ViewManager viewManager] viewController:NEWS_DETAILS_VIEW] totalItemCount:[[[Application application] aItems]currOffbeatItemCount]];	
					
					
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
	else
	{
		// Create the required views
		[[ViewManager viewManager] releaseViewController: ITEM_TABLE_VIEW];
		[[ViewManager viewManager] createTableViewController: ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: OFFBEAT_CHANNEL_NAME andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
		
		ItemTableViewController* itemTable = (ItemTableViewController *)[[ViewManager viewManager] viewController:ITEM_TABLE_VIEW];
		[itemTable setCurrentItemCount:[[[Application application] aItems]currOffbeatItemCount]];
		[itemTable setCurrentOffsetCount:0];
		[itemTable setTotalItemCount:10];
		[itemTable setItemInfo:[[[Application application] aItems] getoffbeatChannelItemInfo]];
		
		// Change the focus to channel explorer tab bar controllers view to display the items in the set channel
		[[ViewManager viewManager] pushViewController: ITEM_TABLE_VIEW animated: YES inTheNavigationViewController: CATEGORIES_NAVIGATION_VIEW];
		
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

