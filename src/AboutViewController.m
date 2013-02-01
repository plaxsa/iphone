//
//  AboutViewController.m
//  MyNews
//  @Description -  Class to display about screen
//  Created by ANKUR AGARWAL on 23/12/08.
//  Copyright 2008 UMUNDO INC. All rights reserved.
//

#import "AboutViewController.h"
#import "General.h"

@implementation AboutViewController


// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
 {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad
{
	// Setting the background color / image of the view
	UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:ICON_ABOUT]];
	CGRect frame = backImage.frame;
	frame.origin.y = -20.0;
	backImage.frame = frame;
	backImage.alpha = 0.75f;
	
	[[self view] insertSubview:backImage atIndex:0];
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
