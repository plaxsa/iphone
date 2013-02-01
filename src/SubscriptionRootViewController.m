//
//  SubscriptionRootViewController.m
//  Umundo
//	@description - Handles the interactions on the subscription View
//
//  Created by Y Kamesh Rao on 28/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "SubscriptionRootViewController.h"
#import "General.h"
#import "ViewManager.h"
#import "Application.h"


@implementation SubscriptionRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		// Initialization code
		// Setting this ViewControllers TabBarItem since it would be added to a UITabBarController
		UITabBarItem *tabBarItem;
		tabBarItem = [[UITabBarItem alloc] initWithTitle: titleOptions image: [UIImage imageNamed: ICON_MYACCOUNT]  tag: 4];
		self.tabBarItem = tabBarItem;	
	}
	return self;
}



// If you need to do additional setup after loading the view, override viewDidLoad.
- (void)viewDidLoad 
{	
	// Create the SUBSCRIBE_VIEW View Controller
	[[ViewManager viewManager] createViewController: SUBSCRIBE_VIEW forNib: XIB_SUBSCRIBE_VIEW];
	
	// Move the control to the table to show the subscription channels
	[[ViewManager viewManager] createNavigationViewController: MY_SUBSCRIPTION_NAVIGATION_VIEW andInitWithRootViewController: SUBSCRIBE_VIEW];
	
	// Add the view to the subscription View
	[[ViewManager viewManager] addViewOfController: MY_SUBSCRIPTION_NAVIGATION_VIEW overTheViewOfController: SUBSCRIPTION_ROOT];
			
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


// Free all the allocated memory
- (void)dealloc 
{
	[super dealloc];
}


@end
