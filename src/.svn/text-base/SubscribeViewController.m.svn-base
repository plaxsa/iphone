//
//  SubscribeViewController.m
//  MyNews
//	@description - Handles the interactions on the subscription View
//  Created by ANKUR AGARWAL on 19/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "SubscribeViewController.h"
#import "General.h"
#import "ViewManager.h"
#import "Application.h"
#import "FileHandler.h"


@implementation SubscribeViewController


// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
		self.title = titleMYSubscription;
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
	
	
	[[[ViewManager viewManager] viewController:SUBSCRIPTION_ROOT].view insertSubview:backdrop atIndex:0];
	
	[super viewDidLoad];
	
	//@description -  Work to set the subscribed channel switch as 'ON'
	
	FileHandler *tempFH = [FileHandler new];
	// from the backend if they are already not cached on the iPhone
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *subscriptionsInfoPath = [documentsDirectory stringByAppendingPathComponent:SUBSCRIPTIONS_FILE_NAME];
	
	if( [tempFH IsFileExists: subscriptionsInfoPath] )	
	{
		// Load the data and make a call to parser method
		NSData *fileData = [tempFH ReadFileContent: subscriptionsInfoPath];
		
		NSString* SubscribedChannels;
		SubscribedChannels = [[NSString alloc] initWithData:fileData encoding:NSASCIIStringEncoding];
		
		NSArray *channelAliases = [[[NSArray alloc] init] autorelease];
		channelAliases = [SubscribedChannels componentsSeparatedByString:@","];
		[SubscribedChannels release];
		
		int value = [channelAliases count];
		// work for which channels are subscribed in the file that channels must be show ON 
		// at the time of start
		for(int i = 0;i< value - 1 ; i++)
		{
			if ([[channelAliases objectAtIndex:i] isEqualToString:TOPNEWS_ALIAS])
			{
				[switch_one setOn:YES];;
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:BUSINESS_ALIAS])
			{
				[switch_two setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:ENTERTAINMENT_ALIAS])
			{
				[switch_three setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:SPORTS_ALIAS])
			{
				[switch_four setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:FOOTBALL_ALIAS])
			{
				[switch_five setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:LIFESTYLE_ALIAS])
			{
				[switch_six setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:PEOPLE_ALIAS])
			{
				[switch_seven setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:SCIENCE_ALIAS])
			{
				[switch_eight setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:OFFBEAT_ALIAS])
			{
				[switch_nine setOn:YES];
			}
			else if ([[channelAliases objectAtIndex:i] isEqualToString:CRICKET_ALIAS])
			{
				[switch_Ten setOn:YES];
			}
						
		}
		
	}
	[tempFH release];
	
	
//	// A about button placed to dispaly about screen
//	UIBarButtonItem *aboutBarButton = [[[UIBarButtonItem alloc]
//									   initWithTitle:titleAbout
//									   style:UIBarButtonItemStyleBordered
//									   target:self
//									   action:@selector(aboutButtonTouch)] autorelease];
//	self.navigationItem.rightBarButtonItem = aboutBarButton;
}



- (void)setDefaultSwitchOn
{
	[switch_three setOn:YES];
	[switch_four setOn:YES];
}




//@Description - To dispaly the about screen
//- (void)aboutButtonTouch
//{
//	///push createchannel view in the my umundo navigation view
//	[[ViewManager viewManager] createViewController:ABOUT_VIEW];
//	[[ViewManager viewManager] pushViewController: ABOUT_VIEW animated:YES inTheNavigationViewController: MY_SUBSCRIPTION_NAVIGATION_VIEW];	
//	
//}



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


// Whenever thr value of UISwitch changed then this method will be call
- (IBAction)SubscribeChannels
{
	NSMutableString *channelAliases = [[NSMutableString alloc] initWithCapacity:500] ;
	
	if ( switch_one.isOn == YES )
	{
		[channelAliases appendString: TOPNEWS_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_two.isOn == YES)
	{
		[channelAliases appendString: BUSINESS_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_three.isOn == YES )
	{
		[channelAliases appendString: ENTERTAINMENT_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_four.isOn == YES)
	{
		[channelAliases appendString: SPORTS_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_five.isOn == YES)
	{
		[channelAliases appendString: FOOTBALL_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_six.isOn == YES)
	{
		[channelAliases appendString: LIFESTYLE_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_seven.isOn == YES )
	{
		[channelAliases appendString: PEOPLE_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_eight.isOn == YES)
	{
		[channelAliases appendString: SCIENCE_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_nine.isOn == YES)
	{
		[channelAliases appendString: OFFBEAT_ALIAS];
		[channelAliases appendString: @","];
	}
	if ( switch_Ten.isOn == YES)
	{
		[channelAliases appendString: CRICKET_ALIAS];
		[channelAliases appendString: @","];
	}
	
		
	NSData* aData;
	aData = [channelAliases dataUsingEncoding: NSASCIIStringEncoding];
	
	// Write all the subscribed aur Unsubscribed channels in the file accordingly
	
	FileHandler *tempFH = [FileHandler new];
	// from the backend if they are already not cached on the iPhone
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *subscriptionsInfoPath = [documentsDirectory stringByAppendingPathComponent:SUBSCRIPTIONS_FILE_NAME];

	if( [tempFH IsFileExists: subscriptionsInfoPath] )	
		[tempFH RemoveFile: subscriptionsInfoPath];
	
	if( ![tempFH IsFileExists: subscriptionsInfoPath] )	
	{
		// Store the User Info strcture
		[tempFH WriteToFile:subscriptionsInfoPath :aData :nil];
	}
	
	[channelAliases release];
	
	[tempFH release];
	
	// Lets make the request to check for updates,set value as subscription tab viewed
	[(UpdatesViewController *)[[ViewManager viewManager] viewController:UPDATES] setIsSubscribeNewChannels: NO];
	
}



// Free all the allocated memory
- (void)dealloc 
{
    [super dealloc];
}


@end
