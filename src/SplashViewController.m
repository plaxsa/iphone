//
//  SplashViewController.m
//  Umundo
//  @description - Handles the showing of the splash screen
//
//  Created by Y Kamesh Rao on 26/08/08.
//  Copyright 2008 Umundo. All rights reserved.
//

#import "SplashViewController.h"
#import "ViewManager.h"
#import "General.h"
#import "FileHandler.h"
#import "Application.h"


@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		// Initialization code			
	}
	return self;
}


// Call at the start of the application
- (void)startApp
{
	[splashTimer invalidate];
	
	[self createHomeTabBar];
}




// @description -Create the home tab bar
- (void)createHomeTabBar
{
	ViewManager *viewMan = [ViewManager viewManager];
	
	// Create the HEADLINES View Controller
	[viewMan createViewController: HEADLINES forNib: nil];
	
	// Create the NEWSCATERS View Controller
	[viewMan createViewController: CATEGORIES forNib: nil];
	
	// Create the UPDATES View Controller
	[viewMan createViewController: GALLERY_VIEW forNib: nil];
	
	// Create the UPDATES View Controller
	[viewMan createViewController: UPDATES forNib: nil];
	
	// Create the SUBSCRIPTION_ROOT View Controller
	[viewMan createViewController: SUBSCRIPTION_ROOT forNib: nil];
	
	// Create the HOME_TAB_BAR View Controller
	[viewMan createTabViewController: HOME_TAB_BAR 
			  andInitWithControllers: [NSArray arrayWithObjects:
									   [viewMan viewController:UPDATES],
									   [viewMan viewController:HEADLINES], 
									   [viewMan viewController:CATEGORIES],	
									   [viewMan viewController:GALLERY_VIEW],
									   [viewMan viewController:SUBSCRIPTION_ROOT],															 
									   nil
									   ]
	 ];
	
	[viewMan releaseViewController: UPDATES];
	[viewMan releaseViewController: HEADLINES];
	[viewMan releaseViewController: CATEGORIES];
	[viewMan releaseViewController: GALLERY_VIEW];
	[viewMan releaseViewController: SUBSCRIPTION_ROOT];
	
	// Set the HOME_TAB_VAR instances of the View Controllers for further use
	[viewMan setViewController: [[(UITabBarController *)[viewMan viewController: HOME_TAB_BAR] viewControllers] objectAtIndex:0] forTheViewID: UPDATES];
	[viewMan setViewController: [[(UITabBarController *)[viewMan viewController: HOME_TAB_BAR] viewControllers] objectAtIndex:1] forTheViewID: HEADLINES];
	[viewMan setViewController: [[(UITabBarController *)[viewMan viewController: HOME_TAB_BAR] viewControllers] objectAtIndex:2] forTheViewID: CATEGORIES];
	[viewMan setViewController: [[(UITabBarController *)[viewMan viewController: HOME_TAB_BAR] viewControllers] objectAtIndex:3] forTheViewID: GALLERY_VIEW];
	[viewMan setViewController: [[(UITabBarController *)[viewMan viewController: HOME_TAB_BAR] viewControllers] objectAtIndex:4] forTheViewID: SUBSCRIPTION_ROOT];
	
//	[(UpdatesViewController*)[viewMan viewController:UPDATES]syncSubscriptionsAndFetchFromBackendIfNeccessary:YES];
	// Set the Home View of the application		
	// Set the Home Tab Bar View on Main Window
	[viewMan setViewOfController: HOME_TAB_BAR andRemoveViewOfActiveController: YES];		
	
	[viewMan setActiveViewControllerinTabViewController: HOME_TAB_BAR];
}




// If you need to do additional setup after loading the view, override viewDidLoad.
- (void)viewDidLoad 
{	
	// Set a 3 second timer to show the Splash for that much time and change to 
	// Login View later if user does nothing for 3 seconds
	splashTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(startApp) userInfo:nil repeats:NO];
}



// @description - To set the LOGIN as a current view after Splash has timed out
- (void)timeout
{
	[splashTimer invalidate];
	[self startApp];
}



// There is something to be done as soon as there is a touch event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self startApp];
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
	if(splashTimer)
		[splashTimer invalidate];
	[super dealloc];
}


@end
