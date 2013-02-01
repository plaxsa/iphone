//
//  HeadLinesViewController.m
//  MyNews
// @Description - To show the top news on the screen, get by top news channel
//  Created by ANKUR AGARWAL on 17/11/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "HeadLinesViewController.h"
#import "HttpRequest.h"
#import "Channels.h"
#import "ViewManager.h"
#import "Application.h"
#import "General.h"
#import "ViewManager.h"

@implementation HeadLinesViewController

// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		// Setting this ViewControllers TabBarItem since it would be added to a UITabBarController
		UITabBarItem *tabBarItem;
		tabBarItem = [[UITabBarItem alloc] initWithTitle: titleTopNews image: [UIImage imageNamed: ICON_HEADLINE]  tag: 1];
		self.tabBarItem = tabBarItem;	
		self.title = titleTopNews; 
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad 
{
	// Create the Table View associated with this view
	[[ViewManager viewManager] createTableViewController: HEADLINES_ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: titleTopNews andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
	
	// Move the control to the table to show the updates
	[[ViewManager viewManager] createNavigationViewController: HEADLINES_NAVIGATION_VIEW andInitWithRootViewController: HEADLINES_ITEM_TABLE_VIEW];
	
	// Add the view to the Updates View
	[[ViewManager viewManager] addViewOfController: HEADLINES_NAVIGATION_VIEW overTheViewOfController: HEADLINES];
		
}



// @Description - Delegate Method of UIWebView Class
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	switch ( navigationType )
	{
			// called when user click on the ads link
		case UIWebViewNavigationTypeLinkClicked:
		{	
			if ( isCliked == NO )
			{
				// set the url to be load in web page
				[(AdsWebPageViewController *)[[ViewManager viewManager] viewController:ADS_WEB_VIEW] setWebURL:request];
			
				// Shows the webpage to view ads
				[self presentModalViewController:[[ViewManager viewManager] viewController:ADS_WEB_VIEW] animated:YES];
				isCliked = YES;
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
	// Request for web ads request
	isCliked = NO;
	CGRect screen = [[UIScreen mainScreen] bounds];
	CGRect frame = CGRectMake(0.0,382, screen.size.width,38);
	if(headlineWebViewFooter)
		RELEASEIF(headlineWebViewFooter);
	headlineWebViewFooter = [[UIWebView alloc] initWithFrame:frame];
	headlineWebViewFooter.backgroundColor = [UIColor darkGrayColor];
	headlineWebViewFooter.scalesPageToFit = NO;
	headlineWebViewFooter.delegate = self;
	headlineWebViewFooter.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
	[headlineWebViewFooter loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
	[self.view addSubview:headlineWebViewFooter];	
	
	[self getTopNews];
	
	[super viewWillAppear:animated];
}




// To make requset for clips from topnews channels
- (void)getTopNews
{
	// Get the local reference for items instance
	Items *items = [[Application application] aItems];
	
	if ( ![items  HeadlineItemInfo])
	{
		// Set the basic channel details in the item class and call for the items in the channel
		[items setHeadlineItemChannelAlias: TOPNEWS_ALIAS];
		[items setHeadlineItemChannelTitle: TOPNEWS_CHANNEL_NAME];
		[items setTotalHeadlineItemCount: 10];
		[items setItemsMode: II_HEADLINES_ITEM];
		[items setOffSetHeadlineItemCount: 0];
		// Set the Animation view that shows the status that the item fetch is in progress
		[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageChannels];
		
		// set NO when clip called first time
		[items setIsHeadlineSecondTime: NO];
		
		// Get the items by making a http request
		[[[Application application] aHttpRequest] getItems:0 :CHANNEL_COUNT_PER_PAGE :TYPE_RECENT :TOPNEWS_ALIAS : MOBILE_PROFILE_NAME:items];
	
	}
	
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


// Free all the memory
- (void)dealloc 
{
	if(headlineWebViewFooter)
		RELEASEIF(headlineWebViewFooter);
	[super dealloc];
}

@end
