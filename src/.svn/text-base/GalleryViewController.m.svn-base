//
//  GalleryViewController.m
//  MyNews
// @Description - To dispaly Videos and Slide Shows in the screen
//  Created by ANKUR AGARWAL on 19/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "GalleryViewController.h"
#import "ViewManager.h"
#import "General.h"
#import "Application.h"

@implementation GalleryViewController


// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
		// Initialization code
		// Setting this ViewControllers TabBarItem since it would be added to a UITabBarController
		UITabBarItem *tabBarItem;
		tabBarItem = [[UITabBarItem alloc] initWithTitle: titleGallery image: [UIImage imageNamed: ICON_GALLERY]  tag: 3];
		self.tabBarItem = tabBarItem;	
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad 
{
	// Create the Table View associated with this view
	[[ViewManager viewManager] createTableViewController: GALLERY_ITEM_TABLE_VIEW andInitWithStyle: UITableViewStylePlain andTitle: titleGallery andRowHeight: CHANNEL_TBL_ROW_HEIGHT];
	
	// Move the control to the table to show the updates
	[[ViewManager viewManager] createNavigationViewController: GALLERY_NAVIGATION_VIEW andInitWithRootViewController: GALLERY_ITEM_TABLE_VIEW];
	
	// Add the view to the Updates View
	[[ViewManager viewManager] addViewOfController: GALLERY_NAVIGATION_VIEW overTheViewOfController: GALLERY_VIEW];
	
	// Display the ads image at the bottom of the screen
	CGRect screen = [[UIScreen mainScreen] bounds];
	CGRect frame = CGRectMake(0.0,382, screen.size.width,38);
	if(galleryWebViewFooter)
		RELEASEIF(galleryWebViewFooter);
	galleryWebViewFooter = [[UIWebView alloc] initWithFrame:frame];
	galleryWebViewFooter.backgroundColor = [UIColor darkGrayColor];
	galleryWebViewFooter.scalesPageToFit = NO;
	galleryWebViewFooter.delegate = self;
	galleryWebViewFooter.autoresizingMask = (UIViewAutoresizingNone | UIViewAutoresizingNone);
	[self.view addSubview:galleryWebViewFooter];
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





// @description - Called when the view is about to made visible. Default does nothing
- (void)viewWillAppear:(BOOL)animated
{
	isClicked = NO;
	[self loadAdsrequest];
	[self getGalleryNews];
	[super viewWillAppear:animated];
}


// Make the wed ads request
- (void)loadAdsrequest
{
	[galleryWebViewFooter loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: GoogleBootom]]];
}


// Get the news of galery
- (void)getGalleryNews
{
	// Get the local reference for items instance
	Items *items = [[Application application] aItems];
	
	if ( ![items  getSlideShowInfo])
	{
		// Set the basic channel details in the item class and call for the items in the channel
		[items setGalleryItemChannelAlias: VIDEOS_CHANNELALIAS];
		[items setGalleryItemChannelTitle: VIDEOS_TITLE];
		[items setTotalGalleryItemCount: ITEMS_COUNT_PER_PAGE];
		[items setItemsMode: II_GALLERY_ITEM];
		[items setOffSetGalleryItemCount: 0];
		// Set the Animation view that shows the status that the item fetch is in progress
		[[ViewManager viewManager] showWaitAnimationAndMessage: networkMessageClips];
		
		// set NO when clip called first time
		[items setIsGallerySecondTime: NO];
		
		// Get the items by making a http request
		[[[Application application] aHttpRequest] getItems:0 :ITEMS_COUNT_PER_PAGE :TYPE_RECENT : VIDEOS_CHANNELALIAS : MOBILE_PROFILE_NAME:items];
		
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


// free all the allocated memory
- (void)dealloc
{
	if(galleryWebViewFooter)
		RELEASEIF(galleryWebViewFooter);
    [super dealloc];
}


@end
