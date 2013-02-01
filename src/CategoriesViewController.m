//
//  CategoriesViewController.m
//  MyNews
// @Description -  Class to get and dispaly Channels on the screen
//  Created by ANKUR AGARWAL on 17/11/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "CategoriesViewController.h"
#import "ViewManager.h"
#import "General.h"
#import "Application.h"

@implementation CategoriesViewController

// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
        // Custom initialization
		// Initialization code
		// Setting this ViewControllers TabBarItem since it would be added to a UITabBarController
		UITabBarItem *tabBarItem;
		tabBarItem = [[UITabBarItem alloc] initWithTitle: titleNews image: [UIImage imageNamed: ICON_NEWS]  tag: 2];
		self.tabBarItem = tabBarItem;	
		self.title = titleNews; 
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad 
{
	// Setting a transparent background color
	[self.view setBackgroundColor:[UIColor clearColor]];
	// Setting the header
	UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_HEADER]];
	UIImageView *backdrop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_GRAY_BACK]];
	[backdrop addSubview: header];
	[[[ViewManager viewManager] viewController:CATEGORIES].view insertSubview:backdrop atIndex:0];
	
	
	// Create the required views
	[[ViewManager viewManager] releaseViewController: CATEGORIES_TABLE_VIEW];
	
	// Create the categories Table View Controller
	[[ViewManager viewManager] createTableViewController: CATEGORIES_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: @"News" andRowHeight: CHANNEL_TBL_ROW_HEIGHT];	
	
	// Create the categories Navigation View Controller and add the Channel Table View to the Navigation View
	[[ViewManager viewManager] createNavigationViewController: CATEGORIES_NAVIGATION_VIEW andInitWithRootViewController: CATEGORIES_TABLE_VIEW];
	
	// Add the categories Navigation View Controller over the Watch View Controller
	[[ViewManager viewManager] addViewOfController: CATEGORIES_NAVIGATION_VIEW overTheViewOfController: CATEGORIES];
	
	
	// Display the ads image at the bottom of the screen
	CGRect screen = [[UIScreen mainScreen] bounds];
	CGRect frame = CGRectMake(0.0,382, screen.size.width,38);
	if(CategoriesWebViewFooter)
		RELEASEIF(CategoriesWebViewFooter);
	CategoriesWebViewFooter = [[UIWebView alloc] initWithFrame:frame];
	CategoriesWebViewFooter.backgroundColor = [UIColor darkGrayColor];
	CategoriesWebViewFooter.scalesPageToFit = NO;
	CategoriesWebViewFooter.delegate = self;
	CategoriesWebViewFooter.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
//	[CategoriesWebViewFooter loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
	[self.view addSubview:CategoriesWebViewFooter];	
	
	[super viewDidLoad];
}



// @Description - Delegate Method of UIWebView Class
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	switch ( navigationType )
	{
			// called when user click on the ads link
		case UIWebViewNavigationTypeLinkClicked:
		{
			if ( isClicked == NO)
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



// @description - Called when the view is about to made visible. Default does nothing
- (void)viewWillAppear:(BOOL)animated
{
	isClicked = NO;
	[CategoriesWebViewFooter loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
	Items *tempItem = [[Application application] aItems];
	if ( [tempItem currOffbeatItemCount] <= 0 )
	{
		[tempItem setisNewsItemSecondTime:YES];
		[tempItem setItemsMode: II_CHANNEL_ONE];
		[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT :TOPNEWS_ALIAS : MOBILE_PROFILE_NAME: tempItem];				
		[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
	}
	[super viewWillAppear:animated];
}



//@description - get the channel offset
- (int)channelOffset
{
	return channelOffset;
}



//@description - Set the channel offset
- (void)setChannelOffset:(int)value
{
	channelOffset = value;
}




//@description - sets that we have made hit for previous channel
- (void)setisHitPreviousChannels: (BOOL)value
{
	isHitPreviousChannels = value;
}



//@description - sets that we have made hit for more channel
- (void)setisHitMoreChannels: (BOOL)value
{
	isHitMoreChannels = value;
}


//@description - sets the current count
- (void)setCurrentCount: (int)value
{
	currentCount = value;
}



//@description - gets the currentcount
- (int)currentCount
{
	return currentCount;
}


//@description - gets the isHitPreviousChannels
- (BOOL)isHitPreviousChannels
{
	return isHitPreviousChannels;
}



//@description - gets the isHitMoreChannels
- (BOOL)isHitMoreChannels
{
	return isHitMoreChannels;
}



// @description - Gets channels of the required parameters from the backend
- (void)getChannelsForBrowsingOfCategory: (NSString *)categoryID filteredBy: (NSString *)filter inOrder: (NSString *)order fromOffset: (int) offset inCount: (int)count
{
	isSecondTime = NO;
	// Setting the View that channels are being fetched
	[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
	
	// Getting a Temp local pointer to the singleton Applications version of Channels
	Channels *tempChannel = [[Application application] aChannels];
	HttpRequest *tempHttpRequest = [[Application application] aHttpRequest];
	
	channelOffset = offset;
	currentCount = count;
	currentOrder = [[NSString alloc] initWithString:order];	
	
	
		// Setting the new filter and categoryID
		[tempChannel setCurrBrowsingFilter:filter];
		[tempChannel setCurrBrowsingCategoryID:categoryID];
		
		// Set this class as delegate to receive control once the channels are recieved
		[tempChannel setChannelViewControllerDelegate: self];
		
		// Setting the mode to get the channels Count
		[tempChannel setChannelsMode: CI_BROWSING_COUNT];
		
		// Getting the Total Number of Channels for the set category and filter
		[tempHttpRequest getNumberOfPublicChannels:categoryID :filter];
	
}




// @description - Gets called when the Channel count is received from the HttpResponseParser delegate
- (void)updateViewOnReceivingChannelsCount
{
	// Getting a Temp local pointer to the singleton Applications version of Channels
	Channels *tempChannel = [[Application application] aChannels];
	if ([tempChannel totalBrowsingChannels] == 0)
	{
		if([[ViewManager viewManager] isMessageDisplayed])
			[[ViewManager viewManager] removeMessage];
		
		[[ViewManager viewManager] showMessage: errorMessageNoChannels andSetTitle: alertTitleNoChannels andDelegateTo: self];
	}
	else
	{
		[self HitingForChannels];
	}
}



// @description - Gets called when the we need to hit for channels
- (void)HitingForChannels
{
	// Remove the message view
	if([[ViewManager viewManager] isMessageDisplayed])
		[[ViewManager viewManager] removeMessage];
	
	// Setting the View that channels are being fetched
	[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
	
	Channels *tempChannel = [[Application application] aChannels];
	HttpRequest *tempHttpRequest = [[Application application] aHttpRequest];
	
	// Set this class as delegate to receive control once the channels are recieved
	[tempChannel setChannelViewControllerDelegate: self];
	
	// Setting the mode to get the browsing channels 
	[tempChannel setChannelsMode: CI_BROWSING];
	
	// Seeing if the total channel count is less than received count
	if([tempChannel totalBrowsingChannels] < CHANNEL_COUNT_PER_PAGE)
		currentCount = [tempChannel totalBrowsingChannels];
	
	// Getting the channels from the backend
	[tempHttpRequest getPublicChannels:[tempChannel currBrowsingCategoryID] :[tempChannel currBrowsingFilter] :TYPE_RECENT :channelOffset :currentCount];
}



// @description - Gets called when the Channels are Received from the HttpResponseParser Delegate
- (void)updateViewOnReceivingChannels
{
	// Getting a Temp local pointer to the singleton Applications version of Channels
	ViewManager *viewMan = [ViewManager viewManager];
	ChannelsTableViewController* channelTable = (ChannelsTableViewController *)[viewMan viewController:CHANNEL_TABLE_VIEW];
	channelTable.navigationItem.title = titleNews;
	CGRect tableFrame = channelTable.tableView.frame;
	// Create a brand new table and set its delegate to be the ChannelsTableViewController class
	UITableView *newTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
	[newTable setBackgroundColor:[UIColor clearColor]];
	newTable.delegate = channelTable;
	// Set the New table view as the table in existing TableViewController
	channelTable.tableView = newTable;
	[newTable release];
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


// @description - To handle retry option on network error
- (void)retryHTTPRequest
{
	// Getting a Temp local pointer to the singleton Applications version of Channels
	Channels *tempChannel = [[Application application] aChannels];
	HttpRequest *tempHttpRequest = [[Application application] aHttpRequest];
	if([[ViewManager viewManager] isMessageDisplayed])
		[[ViewManager viewManager] removeMessage];
	switch([tempChannel channelsMode])
	{
		case CI_BROWSING:
		{
			[tempHttpRequest getPublicChannels:[tempChannel currBrowsingCategoryID] :[tempChannel currBrowsingFilter] :TYPE_RECENT :channelOffset :currentCount];
		}
			break;
		case CI_BROWSING_COUNT:
		{
			[self getChannelsForBrowsingOfCategory:nil filteredBy: @"all" inOrder:TYPE_RECENT fromOffset:0 inCount:CHANNEL_COUNT_PER_PAGE];
		}
			break;
	}
}


// free all the allocated memory
- (void)dealloc 
{
	if(CategoriesWebViewFooter)
		RELEASEIF(CategoriesWebViewFooter);
    [super dealloc];
}


@end
