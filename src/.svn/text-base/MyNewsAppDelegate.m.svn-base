//
//  MyNewsAppDelegate.m
//  MyNews
//  Delegate class for this appliaction, call at the first time when app lounch
//  Created by ANKUR AGARWAL on 17/11/08.
//  Copyright UMUNDO INC 2008. All rights reserved.
//

#import "MyNewsAppDelegate.h"
#import "ViewManager.h"
#import "General.h"
#import "Application.h"

@implementation MyNewsAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application
{    
    // Set the View Managers Window instance as the window in this delegate - i.e. Main Window
	[[ViewManager viewManager] setAppWindow:window];
	
	// Create the SPLASH View Controller
	[[ViewManager viewManager] createViewController:SPLASH forNib:XIB_SPLASH_VIEW];
	
	// Set the Splash View on Main Window
	[[ViewManager viewManager] setViewOfController:SPLASH andRemoveViewOfActiveController: NO];	
	
	// Override point for customization after app launch	
    [window makeKeyAndVisible];	
	
	// Create the MediaPlayerViewController since we would be needing it to play videos
	[[ViewManager viewManager] createViewController: MEDIA_PLAYER_VIEW];	
	
	// Create the NewsDetailViewController to display images from the MyNews system
	[[ViewManager viewManager] createViewController: NEWS_DETAILS_VIEW forNib:XIB_IMAGE_VIEW];
	
	
	// Create the slideShoeView to display images from the MyNews system
	[[ViewManager viewManager] createViewController: SLIDE_SHOW_VIEW forNib:XIB_SCROLL_VIEW];
	
	// Create the AdswebsViewController to display ads
	[[ViewManager viewManager] createViewController: ADS_WEB_VIEW forNib:XIB_ADS_VIEW];
	
	[[ViewManager viewManager] createViewController: ENLARGE_VIEW forNib:XIB_ENLARGE_VIEW];
	
}


- (void)dealloc
{
    [window release];
    [super dealloc];
}


@end
