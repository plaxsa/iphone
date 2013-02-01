//
//  ViewManager.m
//  Umundo
//  @description - Handles all the views and their controllers and change of control among them
//
//  Created by Y Kamesh Rao on 26/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "ViewManager.h"
#import "CommonUtils.h"
#import "General.h"
#import "AppProtocols.h"


@implementation ViewManager

static ViewManager *viewManager;

+ (ViewManager *)viewManager
{
	@synchronized(self)
	{
		if(!viewManager)
			[[ViewManager alloc] init];
		
		return viewManager;
	}
	
	return nil;
}



+ (id)alloc
{
	@synchronized(self)
	{
		NSAssert(viewManager == nil, @"Attempted to allocate a second instance of a singleton.");
		viewManager = [super alloc];
		return viewManager;
	}
	
	return nil;
}



- (id)init
{
	@synchronized(self)
	{
		if(![super init])
			return nil;
		
		return self;
	}
	
	return nil;
}



// @description - Returns the current UIWindow pointer to the window instance
- (UIWindow *)appWindow
{
	return appWindow;
}



// @description - Sets the App Window
- (void)setAppWindow : (UIWindow *)window
{
	appWindow = window;
}


// @description - Initializes the Manager with the current Apps UIWindow instance
- (id)initManagerForWindow: (UIWindow *)window
{
	if([super init])
	{
		appWindow = window;
	}
	
	return self;
}



// @description - Returns the view controller
- (UIViewController *)viewController: (View)viewID
{
	switch(viewID)
	{

		case SPLASH:
			return splashViewController;
			break;
		
		case HEADLINES:
			return headLinesViewController;
			break;
			
		case HEADLINES_ITEM_TABLE_VIEW:
			return headLinesItemTableViewController;
			break;
		
		case CATEGORIES:
			return categoriesViewController;
			break;
						
		case UPDATES:
			return updatesViewController;
			break;	
			
		case MEDIA_PLAYER_VIEW:
			return mediaPlayerViewController;
			break;	
			
		case SUBSCRIPTION_ROOT:
			return mySubscriptionrootViewController;
			break;
			
		case HOME_TAB_BAR:
			return homeTabBarController;
			break;
			
		case UPDATES_NAVIGATION_VIEW:
			return updatesNavigationController;
			break;
			
		case UPDATES_TABLE_VIEW:
			return updatesTableViewController;
			break;	
			
			
		case ITEM_TABLE_VIEW:
			return itemTableViewController;
			break;
			
		case ITEM_NAVIGATION_VIEW:
			return itemsNavigationController;
			break;	
			
		case NEWS_DETAILS_VIEW:
			return newsDetailViewController;
			break;	
			
				
		case CATEGORIES_TABLE_VIEW:
			return categoriesTableViewController;
			break;
			
		case CATEGORIES_NAVIGATION_VIEW:
			return categoriesNavigationController;
			break;	
			
		case CHANNEL_TABLE_VIEW:
			return channelsTableViewController;
			break;
			
		case MY_SUBSCRIPTION_NAVIGATION_VIEW:
			return mySubscriptionNavigationController;
			break;	
			
		case HEADLINES_NAVIGATION_VIEW:
			return headlinesNavigationController;
			break;	
			
		case SUBSCRIBE_VIEW:
			return subscribeViewController;
			break;
			
		case GALLERY_VIEW:
			return galleryViewController;
			break;
			
		case GALLERY_NAVIGATION_VIEW:
			return galleryNavigationController;
			break;
			
		case GALLERY_ITEM_TABLE_VIEW:
			return galleryItemTableViewController;
			break;			
			
		case ABOUT_VIEW:
			return aboutViewController;
			break;
			
		case SLIDE_SHOW_VIEW:
			return scrollViewController;
			break;
			
		case ADS_WEB_VIEW:
			return adsWebPageViewController;
			break;
			
		case ENLARGE_VIEW:
			return enlargeImageViewController;
			break;
		
		default:
			return nil;
			break;
	}
	
	return nil;
}



// @description - Creates a specified view controller
- (void)createViewController: (View)viewID
{
	switch(viewID)
	{
		
		case SPLASH:
			RELEASEIF(splashViewController);
			splashViewController = [[SplashViewController alloc] init];
			break;
			
		case HEADLINES:
			RELEASEIF(headLinesViewController);
			headLinesViewController = [[HeadLinesViewController alloc] init];
			break;
			
		case CATEGORIES:
			RELEASEIF(categoriesViewController);
			categoriesViewController = [[CategoriesViewController alloc] init];
			break;
			
			
		case UPDATES:
			RELEASEIF(updatesViewController);
			updatesViewController = [[UpdatesViewController alloc] init];
			break;	
			
		case MEDIA_PLAYER_VIEW:
			RELEASEIF(mediaPlayerViewController);
			mediaPlayerViewController = [[MediaPlayerViewController alloc] init];
			break;
			
		case NEWS_DETAILS_VIEW:
			RELEASEIF(newsDetailViewController);
			newsDetailViewController = [[NewsDetailViewController alloc] init];
			break;
			
			
		case SUBSCRIPTION_ROOT:
			RELEASEIF(mySubscriptionrootViewController);
			mySubscriptionrootViewController = [[SubscriptionRootViewController alloc] init];
			break;		
			
			
		case SUBSCRIBE_VIEW:
			RELEASEIF(subscribeViewController);
			subscribeViewController = [[SubscribeViewController alloc] init];
			break;
			
		case GALLERY_VIEW:
			RELEASEIF(galleryViewController);
			galleryViewController = [[GalleryViewController alloc] init];
			break;
			
		case ABOUT_VIEW:
			RELEASEIF(aboutViewController);
			aboutViewController = [[AboutViewController alloc] init];
			break;
			
		case SLIDE_SHOW_VIEW:
			RELEASEIF(scrollViewController);
			scrollViewController = [[SlideshowViewController alloc] init];
			break;
			
		case ADS_WEB_VIEW:
			RELEASEIF(adsWebPageViewController);
			adsWebPageViewController = [[AdsWebPageViewController alloc] init];
			break;
			
		case ENLARGE_VIEW:
			RELEASEIF(enlargeImageViewController);
			enlargeImageViewController = [[EnlargeImageViewController alloc] init];
			break;
	}
}



// @description - Creates a specified view controller and initializes it with the given NIB name
- (void)createViewController: (View)viewID forNib: (NSString *)nibName
{
	switch(viewID)
	{
		
		case SPLASH:
			RELEASEIF(splashViewController);
			splashViewController = [[SplashViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
		
		case HEADLINES:
			RELEASEIF(headLinesViewController);
			headLinesViewController = [[HeadLinesViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
			
		case CATEGORIES:
			RELEASEIF(categoriesViewController);
			categoriesViewController = [[CategoriesViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;	
			
		case UPDATES:
			RELEASEIF(updatesViewController);
			updatesViewController = [[UpdatesViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;	
			
		case MEDIA_PLAYER_VIEW:
			RELEASEIF(mediaPlayerViewController);
			mediaPlayerViewController = [[MediaPlayerViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;	
			
		case NEWS_DETAILS_VIEW:
			RELEASEIF(newsDetailViewController);
			newsDetailViewController = [[NewsDetailViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;	
			
		
		case SUBSCRIPTION_ROOT:
			RELEASEIF(mySubscriptionrootViewController);
			mySubscriptionrootViewController = [[SubscriptionRootViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;	
			
			
		case SUBSCRIBE_VIEW:
			RELEASEIF(subscribeViewController);
			subscribeViewController = [[SubscribeViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
			
		case GALLERY_VIEW:
			RELEASEIF(galleryViewController);
			galleryViewController = [[GalleryViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
			
		case ABOUT_VIEW:
			RELEASEIF(aboutViewController);
			aboutViewController = [[AboutViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
			
		case SLIDE_SHOW_VIEW:
			RELEASEIF(scrollViewController);
			scrollViewController = [[SlideshowViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
			
		case ADS_WEB_VIEW:
			RELEASEIF(adsWebPageViewController);
			adsWebPageViewController = [[AdsWebPageViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
			
		case ENLARGE_VIEW:
			RELEASEIF(enlargeImageViewController);
			enlargeImageViewController = [[EnlargeImageViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
			break;
			
	
	}
}



// @description - Creates a Tab View Controller and initializes it with Controllers
- (void)createTabViewController: (View)viewID andInitWithControllers: (NSArray *)viewControllers
{
	switch(viewID)
	{
		case HOME_TAB_BAR:
			if(homeTabBarController)
				homeTabBarController = nil;
			RELEASEIF(homeTabBarController);
			homeTabBarController = [[UITabBarController alloc] init];
			homeTabBarController.viewControllers = viewControllers;
			break;	
	}	
}



// @description - set the desired tab active in tab view controller
- (void)setActiveViewControllerinTabViewController: (View)viewID
{
	switch(viewID)
	{
		case HOME_TAB_BAR:
		{
			if(homeTabBarController)
			{
				[homeTabBarController setSelectedIndex:0]; // set the updates tab selected
			}
		}
		break;
	}	
}



// @description - Creates a Table View Controller and initializes its Table View
- (void)createTableViewController: (View)viewID andInitWithStyle: (UITableViewStyle)style andTitle: (NSString *)title andRowHeight: (int)rowHeight
{
	UIColor *separatorColor = [[UIColor alloc] initWithRed: (197.0/255.0) green:(197.0/255.0) blue:(197.0/255.0) alpha:1.0];
	
	switch(viewID)
	{
		case CHANNEL_TABLE_VIEW:
			RELEASEIF(channelsTableViewController);
			channelsTableViewController = [[ChannelsTableViewController alloc] initWithStyle: style];
			channelsTableViewController.tableView.separatorColor = separatorColor;
			if(title)
				channelsTableViewController.title = title;
			
			if(rowHeight)
				channelsTableViewController.tableView.rowHeight = rowHeight;
			break;
			
		case ITEM_TABLE_VIEW:
			RELEASEIF(itemTableViewController);
			itemTableViewController = [[ItemTableViewController alloc] initWithStyle: style];
			itemTableViewController.tableView.separatorColor = separatorColor;
			
			if(title)
				itemTableViewController.title = title;

			if(rowHeight)
				itemTableViewController.tableView.rowHeight = rowHeight;
			break;
			
			
		case UPDATES_TABLE_VIEW:
			RELEASEIF(updatesTableViewController);
			updatesTableViewController = [[UpdatesTableViewController alloc] initWithStyle: style];
			updatesTableViewController.tableView.separatorColor = separatorColor;//[UIColor clearColor];;
			
			if(title)
				updatesTableViewController.title = title;
			
			if(rowHeight)
				updatesTableViewController.tableView.rowHeight = rowHeight;
			break;
			
			
		case CATEGORIES_TABLE_VIEW:
			RELEASEIF(categoriesTableViewController);
			categoriesTableViewController = [[CategoriesTableViewController alloc] initWithStyle: style];
			categoriesTableViewController.tableView.separatorColor = separatorColor;
			
			if(title)
				categoriesTableViewController.title = title;
			
			if(rowHeight)
				categoriesTableViewController.tableView.rowHeight = rowHeight;
			break;	
			
		case HEADLINES_ITEM_TABLE_VIEW:
			RELEASEIF(headLinesItemTableViewController);
			headLinesItemTableViewController = [[HeadLinesItemTableViewController alloc] initWithStyle: style];
			headLinesItemTableViewController.tableView.separatorColor = [UIColor clearColor];
			
			if(title)
				headLinesItemTableViewController.title = title;
			
			if(rowHeight)
				headLinesItemTableViewController.tableView.rowHeight = rowHeight;
			break;
			

		case GALLERY_ITEM_TABLE_VIEW:
			RELEASEIF(galleryItemTableViewController);
			galleryItemTableViewController = [[GalleryItemTableViewController alloc] initWithStyle: style];
			galleryItemTableViewController.tableView.separatorColor = [UIColor clearColor];
			
			if(title)
				galleryItemTableViewController.title = title;
			
			if(rowHeight)
				galleryItemTableViewController.tableView.rowHeight = rowHeight;
			break;
			

	}
}



// @description - Creates a Navigation View Controller
- (void)createNavigationViewController: (View)viewID andInitWithRootViewController: (View)rootViewID
{
	switch(viewID)
	{			
			
		case ITEM_NAVIGATION_VIEW:
		{
			RELEASEIF(itemsNavigationController);
			itemsNavigationController = [[UINavigationController alloc] initWithRootViewController: [self viewController: rootViewID]];
			[itemsNavigationController setNavigationBarHidden:NO animated:NO];
			itemsNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
			
			// Setting the origin at 0 to remove the top white space
			CGRect frame = itemsNavigationController.view.frame;
			frame.origin.y = 0.0;
			itemsNavigationController.view.frame = frame;	
			break;			
		}
			
		case UPDATES_NAVIGATION_VIEW:
		{
			RELEASEIF(updatesNavigationController);
			updatesNavigationController = [[UINavigationController alloc] initWithRootViewController: [self viewController: rootViewID]];
			[updatesNavigationController setNavigationBarHidden:NO animated:NO];
			updatesNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
			
			// Setting the origin at 0 to remove the top white space
			CGRect frame = updatesNavigationController.view.frame;
			frame.origin.y = 0.0;
			updatesNavigationController.view.frame = frame;	
			break;			
		}
			
		case CATEGORIES_NAVIGATION_VIEW:
		{
			RELEASEIF(categoriesNavigationController);
			categoriesNavigationController = [[UINavigationController alloc] initWithRootViewController: [self viewController: rootViewID]];
			[categoriesNavigationController setNavigationBarHidden:NO animated:NO];
			categoriesNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
			
			// Setting the origin at 0 to remove the top white space
			CGRect frame = categoriesNavigationController.view.frame;
			frame.origin.y = 0.0;
			categoriesNavigationController.view.frame = frame;	
			break;			
		}		
						
		case MY_SUBSCRIPTION_NAVIGATION_VIEW:
		{
			RELEASEIF(mySubscriptionNavigationController);
			mySubscriptionNavigationController = [[UINavigationController alloc] initWithRootViewController: [self viewController: rootViewID]];
			[mySubscriptionNavigationController setNavigationBarHidden:NO animated:NO];
			mySubscriptionNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
			
			// Setting the origin at 0 to remove the top white space
			CGRect frame = mySubscriptionNavigationController.view.frame;
			frame.origin.y = 0.0;
			mySubscriptionNavigationController.view.frame = frame;	
			
			break;			
		}	
			
		case HEADLINES_NAVIGATION_VIEW:
		{
			RELEASEIF(headlinesNavigationController);
			headlinesNavigationController = [[UINavigationController alloc] initWithRootViewController: [self viewController: rootViewID]];
			[headlinesNavigationController setNavigationBarHidden:NO animated:NO];
			headlinesNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
			
			// Setting the origin at 0 to remove the top white space
			CGRect frame = headlinesNavigationController.view.frame;
			frame.origin.y = 0.0;
			headlinesNavigationController.view.frame = frame;	
			break;			
		}
			
		case GALLERY_NAVIGATION_VIEW:
		{
			RELEASEIF(galleryNavigationController);
			galleryNavigationController = [[UINavigationController alloc] initWithRootViewController: [self viewController: rootViewID]];
			[galleryNavigationController setNavigationBarHidden:NO animated:NO];
			galleryNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
			
			// Setting the origin at 0 to remove the top white space
			CGRect frame = galleryNavigationController.view.frame;
			frame.origin.y = 0.0;
			galleryNavigationController.view.frame = frame;	
			break;			
		}		
	}
}



// @description - Set the view controller instance created or stored somewhere else
- (void)setViewController: (id)viewController forTheViewID: (View)viewID
{
	switch (viewID) 
	{
		case HEADLINES:
			RELEASEIF(headLinesViewController);
			headLinesViewController = (HeadLinesViewController *)viewController;
			break;
						
		case CATEGORIES:
			RELEASEIF(categoriesViewController);
			categoriesViewController = (CategoriesViewController *)viewController;
			break;
			
		case UPDATES:
			RELEASEIF(updatesViewController);
			updatesViewController = (UpdatesViewController *)viewController;
			break;
			
		
			
		case SUBSCRIPTION_ROOT:
			RELEASEIF(mySubscriptionrootViewController);
			mySubscriptionrootViewController = (SubscriptionRootViewController *)viewController;
			break;	
			
			
		case SUBSCRIBE_VIEW:
			RELEASEIF(subscribeViewController);
			subscribeViewController = (SubscribeViewController *)viewController;
			break;
			
		case GALLERY_VIEW:
			RELEASEIF(galleryViewController);
			galleryViewController = (GalleryViewController *)viewController;
			break;
			
		case ABOUT_VIEW:
			RELEASEIF(aboutViewController);
			aboutViewController = (AboutViewController *)viewController;
			break;
			
		case SLIDE_SHOW_VIEW:
			RELEASEIF(scrollViewController);
			scrollViewController = (SlideshowViewController *)viewController;
			break;
			
		case ADS_WEB_VIEW:
			RELEASEIF(adsWebPageViewController);
			adsWebPageViewController = (AdsWebPageViewController *)viewController;
			break;
			
		case ENLARGE_VIEW:
			RELEASEIF(enlargeImageViewController);
			enlargeImageViewController = (EnlargeImageViewController *)viewController;
			break;
		
		default:
			break;
	}
}



// @description - Sets the view as the current view	
- (void)setViewOfController: (View)viewID andRemoveViewOfActiveController: (BOOL)remove
{
	//////////////////////////////////////////////////////////////////////////
	/// Code to set all the views to animate
	
	UIViewController *activeViewController = [self viewController: activeViewID];
	UIViewController *newViewController = [self viewController: viewID];
	
	UIView *activeView = activeViewController.view;
	UIView *newView = newViewController.view;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75f];
	[UIView setAnimationTransition:([activeView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:appWindow cache:YES];
	
	[newViewController viewWillAppear:YES];
	[activeViewController viewWillDisappear:YES];
		
	// If the caller has asked to remove the view of active controller, do so
	if(remove)
		[activeView removeFromSuperview];
		
	[appWindow addSubview:newView];
	[activeViewController viewDidDisappear:YES];
	[newViewController viewDidAppear:YES];
			 
	[UIView commitAnimations];
	
	// Storing the current View
	activeViewID = viewID;
}




// @description - Sets the view as the current view	and draws the new view over a Gray Backdrop
- (void)setViewOfControllerOnGrayBackdrop: (View)viewID andRemoveViewOfActiveController: (BOOL)remove
{
	//////////////////////////////////////////////////////////////////////////
	/// Code to set all the views to animate
	
	UIViewController *activeViewController = [self viewController: activeViewID];
	UIViewController *newViewController = [self viewController: viewID];
	
	UIView *activeView = activeViewController.view;
	UIView *newView = newViewController.view;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75f];
	[UIView setAnimationTransition:([activeView superview] ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft) forView:appWindow cache:YES];
	
	[newViewController viewWillAppear:YES];
	[activeViewController viewWillDisappear:YES];
	
	// If the caller has asked to remove the view of active controller, do so
	if(remove)
		[activeView removeFromSuperview];
	
	// Setting the header and backdrop
	UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_HEADER]];
	UIImageView *backdrop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMG_GRAY_BACK]];
	[backdrop addSubview: header];
	
	// Setting the origin at 0 to remove the top white space
	CGRect frame = backdrop.frame;
	frame.origin.y = 20.0;
	backdrop.frame = frame;	
	
	[appWindow addSubview:backdrop];	
	[appWindow addSubview:newView];
	
	
	[activeViewController viewDidDisappear:YES];
	[newViewController viewDidAppear:YES];
	
	[UIView commitAnimations];
	
	// Storing the current View
	activeViewID = viewID;
}



// @description - Adds the View of Controller specified by the ID over the View of Controller of the base ID
- (void)addViewOfController: (View)viewID overTheViewOfController: (View)baseViewID
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.25f];
	[UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:appWindow cache:YES];
	
	[ [[self viewController: baseViewID] view] addSubview: [[self viewController: viewID] view] ];
	
	[UIView commitAnimations];
}



// @description - Inserts the View of Controller specified by the ID to the View of controller of the base ID
- (void)insertViewOfController: (View)viewID toTheViewOfController: (View)baseViewID atIndex: (NSInteger)index
{
	[ [[self viewController: baseViewID] view] insertSubview: [[self viewController: viewID] view] atIndex: index ];	
}



// @description - Pushes a view controller on the navigation controller stack
- (void)pushViewController: (View)viewID animated: (BOOL)animate inTheNavigationViewController: (View)navViewID
{
	UINavigationController *tempRefNav = (UINavigationController *)[self viewController: navViewID];
	[ tempRefNav pushViewController: [self viewController: viewID] animated: animate ];
}



// @description - Pops a controller from the navigation controller stack
- (void)popViewController: (View)viewID animated: (BOOL)animate inTheNavigationViewController: (View)navViewID
{
	UINavigationController *tempRefNav = (UINavigationController *)[self viewController: navViewID];
	[ tempRefNav popViewControllerAnimated: animate ];
}



// @description - Remove the active view controller
- (void)removeActiveViewController
{
}



// @description - Remove the view of the passed controller
- (void)removeViewOfController: (View)viewID
{
	UIViewController *viewController = [self viewController:viewID];
	[[viewController view] removeFromSuperview];
}



// @description - Free the view controller
- (void)releaseViewController: (View)viewID
{
	switch(viewID)
	{
		case SPLASH:
			RELEASEVIEWCTRLRIF(splashViewController);
			break;
		
			
		case HEADLINES:
			RELEASEVIEWCTRLRIF(headLinesViewController);
			break;
						
		case HEADLINES_ITEM_TABLE_VIEW:
			RELEASEVIEWCTRLRIF(headLinesItemTableViewController);
			break;
			
		case HEADLINES_NAVIGATION_VIEW:
			RELEASEVIEWCTRLRIF(headlinesNavigationController);
			break;	
			
		case CATEGORIES:
			RELEASEVIEWCTRLRIF(categoriesViewController);
			break;
			
		case UPDATES:
			RELEASEVIEWCTRLRIF(updatesViewController);
			break;
			
		case MEDIA_PLAYER_VIEW:
			RELEASEVIEWCTRLRIF(mediaPlayerViewController);
			break;
			
		case UPDATES_TABLE_VIEW:
			RELEASEVIEWCTRLRIF(updatesTableViewController);
			break;
			
		case UPDATES_NAVIGATION_VIEW:
			RELEASEVIEWCTRLRIF(updatesNavigationController);
			break;	
			
		case HOME_TAB_BAR:
			RELEASEVIEWCTRLRIF(homeTabBarController);
			break;	
			
		case ITEM_TABLE_VIEW:
			RELEASEVIEWCTRLRIF(itemTableViewController);
			break;
			
		case ITEM_NAVIGATION_VIEW:
			RELEASEVIEWCTRLRIF(itemsNavigationController);
			break;
			
		case NEWS_DETAILS_VIEW:
			RELEASEVIEWCTRLRIF(newsDetailViewController);
			break;
			
			
		case MY_SUBSCRIPTION_NAVIGATION_VIEW:
			RELEASEVIEWCTRLRIF(mySubscriptionNavigationController);
			break;	
			
		case SUBSCRIPTION_ROOT:
			RELEASEVIEWCTRLRIF(mySubscriptionrootViewController);
			break;
								
		case CATEGORIES_TABLE_VIEW:
			RELEASEVIEWCTRLRIF(categoriesTableViewController);
			break;
			
		case CATEGORIES_NAVIGATION_VIEW:
			RELEASEVIEWCTRLRIF(categoriesNavigationController);
			break;	
			
		case CHANNEL_TABLE_VIEW:
			RELEASEVIEWCTRLRIF(channelsTableViewController);
			break;	
	
	
		case SUBSCRIBE_VIEW:
			RELEASEVIEWCTRLRIF(subscribeViewController);
			break;
			
		case GALLERY_VIEW:
			RELEASEVIEWCTRLRIF(galleryViewController);
			break;
			
		case GALLERY_NAVIGATION_VIEW:
			RELEASEVIEWCTRLRIF(galleryNavigationController);
			break;		
			
		case GALLERY_ITEM_TABLE_VIEW:
			RELEASEVIEWCTRLRIF(galleryItemTableViewController);
			break;
			
		case ABOUT_VIEW:
			RELEASEVIEWCTRLRIF(aboutViewController);
			break;
		
		case SLIDE_SHOW_VIEW:
			RELEASEVIEWCTRLRIF(scrollViewController);
			break;
			
		case ADS_WEB_VIEW:
			RELEASEVIEWCTRLRIF(adsWebPageViewController);
			break;
			
		case ENLARGE_VIEW:
			RELEASEVIEWCTRLRIF(enlargeImageViewController);
			break;
		}
}



// @description - Show Messages With Animation
- (void)showWaitAnimationAndMessage: (NSString *)message
{
	
	// First and formost - disable the user interaction on the window during the network communication
	appWindow.userInteractionEnabled = NO;
	
#define CONN_TV_WIDTH		164
#define CONN_TV_HEIGHT		109
	
	// Create an Animation View snd display it
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	
	RELEASEIF(messageView);
	messageView = [[UIView alloc] initWithFrame: CGRectMake( (screenRect.size.width/2) - (CONN_TV_WIDTH/2), (screenRect.size.height/2) - (CONN_TV_HEIGHT/2), CONN_TV_WIDTH, CONN_TV_HEIGHT)];
	
	// Create the Image View and load the images
	UIImageView *imageView;
	imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: CONNECTIVITY]];
	CGRect imgFrame = CGRectMake(0.0, 0.0, CONN_TV_WIDTH, CONN_TV_HEIGHT);
	imageView.frame = imgFrame;
	
	// Create the activity view indicator
	UIActivityIndicatorView *networkActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	CGRect animFrame = CGRectMake((CONN_TV_WIDTH/2) - (networkActivityIndicator.frame.size.width/2)-5, 38, networkActivityIndicator.frame.size.width, networkActivityIndicator.frame.size.height);
	networkActivityIndicator.frame = animFrame;
	[networkActivityIndicator startAnimating];
	
	// Create and Show the Message Label
	UILabel *msgView = [[CommonUtils commonUtils] createLabelInFrame: CGRectMake(0, -13, CONN_TV_WIDTH, 60)
															withText: message 
														andAlignment: UITextAlignmentCenter
														andTextColor: [UIColor blackColor]						
														andBackColor: [UIColor clearColor]
															andAlpha: 1.0
						];
	
	UIFont *textFont = [UIFont systemFontOfSize:12];
	msgView.font = textFont;
	
	// Make this view to receive the exclusive touch events
	messageView.exclusiveTouch = YES;

	// Add message and image to the messageView	
	[imageView addSubview:networkActivityIndicator];
	[imageView addSubview:msgView];
	[messageView addSubview:imageView];
	
	// Add the messageView to the main window
	[appWindow addSubview: messageView];
	messageDisplayed = YES;
	animationMessageDisplayed = YES;
}



// @description - Show Message
- (void)showMessage: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate
{	
	// Remove any active network animtions displayed
	if([self isMessageDisplayed])
		[self removeMessage];
	
	UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle: title message:message delegate:delegate cancelButtonTitle: alertOk otherButtonTitles: nil];
	[messageAlert show];
	[messageAlert release];
}



// @description - Show Message
- (void)showMessageWithRetry: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate
{	
	// Remove any active network animtions displayed
	if([self isMessageDisplayed])
		[self removeMessage];
	
	UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle: title message:message delegate:delegate cancelButtonTitle: alertOk otherButtonTitles: alertRetry,nil];
	[messageAlert show];
	[messageAlert release];
}



// @description - Show Message with only retry
- (void)showMessageRetry: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate
{	
	// Remove any active network animtions displayed
	if([self isMessageDisplayed])
		[self removeMessage];
	
	UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle: title message:message delegate:delegate cancelButtonTitle: nil otherButtonTitles: alertRetry,nil];
	[messageAlert show];
	[messageAlert release];
}



// @description - Show Message
- (void)showMessageWithYesNo: (NSString *)message andSetTitle: (NSString *)title andDelegateTo: (id)delegate
{	
	// Remove any active network animtions displayed
	if([self isMessageDisplayed])
		[self removeMessage];
	
	UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle: title message:message delegate:delegate cancelButtonTitle: alertYes otherButtonTitles: alertNo,nil];
	[messageAlert show];
	[messageAlert release];
}



// @description - Remove the message
- (void)removeMessage
{
	// First and formost - disable the user interaction on the window during the network communication
	appWindow.userInteractionEnabled = YES;
	
	// Stop the timer if it is on - Timed message is shown
	if(messageTimer)
	{
		[messageTimer invalidate];
		RELEASEIF(messageTimer);
	}
	
	// Remove the messageView
	[messageView removeFromSuperview];
	messageDisplayed = NO;
}
		
		

// @description - Is Message Displayed
- (BOOL)isMessageDisplayed
{
	return messageDisplayed;
}


// @description - Free all the allocated resources
- (void)dealloc
{
	RELEASEIF(messageView);
	RELEASEIF(messageString);
	RELEASEIF(messageTimer);
	
	for(int i=SPLASH; i<TOTAL_VIEWS; i++)
		[self releaseViewController: i];
	[super dealloc];
}



@end
